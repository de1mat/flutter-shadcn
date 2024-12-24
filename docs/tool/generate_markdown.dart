import 'dart:io';
import 'package:path/path.dart' as path;

void main() async {
  // Create markdown directory if it doesn't exist
  final markdownDir = Directory('docs/lib/markdown');
  if (!await markdownDir.exists()) {
    await markdownDir.create(recursive: true);
  }

  // Source directories
  final docsDir = Directory('docs/lib/pages/docs');
  final componentsDir = Directory('docs/lib/pages/docs/components');

  if (!await docsDir.exists()) {
    print('Error: Docs directory not found at ${docsDir.path}!');
    return;
  }

  // Process documentation files
  try {
    // 1) Top-level documentation pages
    await processDocsDirectory(docsDir, markdownDir);

    // 2) Component files
    await processComponentsDirectory(componentsDir, markdownDir);
  } catch (e) {
    print('Error processing documentation: $e');
  }
}

Future<void> processDocsDirectory(
  Directory docsDir,
  Directory markdownDir,
) async {
  await for (final entity in docsDir.list()) {
    if (entity is File &&
        entity.path.endsWith('_page.dart') &&
        !entity.path.contains('/components/')) {
      final pageName = path.basenameWithoutExtension(entity.path).replaceAll('_page', '');

      try {
        // Read the page file content
        final pageContent = await entity.readAsString();

        // Generate markdown for the page
        final markdown = generateMarkdown(
          pageName,
          pageContent,
          [], // No examples for top-level pages
        );

        // Write markdown file
        final markdownFile = File(
          path.join(markdownDir.path, '$pageName.md'),
        );
        await markdownFile.writeAsString(markdown);

        print('Generated documentation for $pageName page');
      } catch (e) {
        print('Error processing $pageName page: $e');
      }
    }
  }
}

Future<void> processComponentsDirectory(
  Directory componentsDir,
  Directory markdownDir,
) async {
  // Track processed components to avoid duplicates
  final processedComponents = <String>{};

  await for (final entity in componentsDir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('_example.dart')) {
      final componentName = path.basenameWithoutExtension(entity.path).replaceAll('_example', '');

      // Skip if already processed
      if (processedComponents.contains(componentName)) continue;
      processedComponents.add(componentName);

      try {
        // Find all related example files
        final componentDir = Directory(path.dirname(entity.path));
        final examples = await findExampleFiles(componentDir, componentName);

        // Read the main component file for description
        final mainFileContent = await entity.readAsString();

        // Generate markdown combining all examples
        final markdown = generateMarkdown(
          componentName,
          mainFileContent,
          examples,
        );

        // Write markdown file
        final markdownFile = File(
          path.join(markdownDir.path, '$componentName.md'),
        );
        await markdownFile.writeAsString(markdown);

        print('Generated documentation for $componentName');
      } catch (e) {
        print('Error processing $componentName: $e');
      }
    }
  }
}

Future<List<String>> findExampleFiles(
  Directory dir,
  String componentName,
) async {
  final examples = <String>[];

  await for (final entity in dir.list(recursive: true)) {
    if (entity is File &&
        entity.path.contains(componentName) &&
        entity.path.contains('example') &&
        !entity.path.endsWith('_example.dart')) {
      try {
        examples.add(await entity.readAsString());
      } catch (e) {
        print('Error reading example file ${entity.path}: $e');
      }
    }
  }
  return examples;
}

/// ----------------------------------------------------------------------------
/// Revised generateMarkdown function with a more relaxed StepItem parsing
/// ----------------------------------------------------------------------------
String generateMarkdown(
  String pageOrComponentName,
  String mainFileContent,
  List<String> exampleFiles,
) {
  final buffer = StringBuffer()
    ..writeln('# ${formatComponentName(pageOrComponentName)}')
    ..writeln();

  // 1) Extract .lead() text (optional)
  final leadTextPattern = RegExp('Text\\([\'"]([^\'"]+)["\']\\)\\.lead\\(\\)');
  final leadMatch = leadTextPattern.firstMatch(mainFileContent);
  if (leadMatch != null) {
    buffer.writeln(leadMatch.group(1));
    buffer.writeln();
  }

  // 2) Extract .h2() headings
  final h2Pattern = RegExp('Text\\([\'"]([^\'"]+)["\']\\)\\.h2\\(\\)');
  final h2Matches = h2Pattern.allMatches(mainFileContent).toList();

  // 3) Parse all StepItems (title + content)
  final stepItems = parseStepItems(mainFileContent);

  // 4) If you want to confirm StepItems are found, optionally debug log:
  // print('DEBUG: Found ${stepItems.length} StepItems');

  // 5) Print headings and step items
  for (final h2Match in h2Matches) {
    final headingText = h2Match.group(1) ?? 'Untitled Section';
    buffer.writeln('## $headingText\n');

    // If you want to filter StepItems by heading, you need more logic
    // (like comparing the text or file positions).
    // For now, just print all StepItems under each heading:
    for (final step in stepItems) {
      buffer.writeln('### ${step.title}\n');

      // Print each descriptive text line
      for (final line in step.descriptiveText) {
        buffer.writeln(line);
        buffer.writeln();
      }

      // Print each code snippet
      for (final snippet in step.codeSnippets) {
        buffer.writeln('```${snippet.mode}');
        buffer.writeln(snippet.code);
        buffer.writeln('```');
        buffer.writeln();
      }
    }
  }

  // 6) Append exampleFiles if you have them (from _example.dart logic)
  if (exampleFiles.isNotEmpty) {
    buffer.writeln('## Examples\n');
    for (final example in exampleFiles) {
      buffer.writeln('```dart');
      buffer.writeln(example);
      buffer.writeln('```');
      buffer.writeln();
    }
  }

  return buffer.toString();
}

/// ----------------------------------------------------------------------------
/// Classes & function to parse `StepItem(...)` blocks
/// ----------------------------------------------------------------------------
class ParsedStepItem {
  final String title;
  final List<String> descriptiveText;
  final List<_ParsedCodeSnippet> codeSnippets;
  final int itemStart; // If you want to do advanced ordering

  ParsedStepItem({
    required this.title,
    required this.descriptiveText,
    required this.codeSnippets,
    required this.itemStart,
  });
}

class _ParsedCodeSnippet {
  final String code;
  final String mode;
  _ParsedCodeSnippet(this.code, this.mode);
}

/// A more flexible pattern for matching StepItem(...) across multiple lines.
/// - dotAll: true => `.*?` can match across newlines.
/// - The pattern allows extra widget calls, spaces, or line breaks.
List<ParsedStepItem> parseStepItems(String sourceCode) {
  // The old pattern was too strict. Let's allow more wiggle room:
  //
  // Explanation:
  // StepItem          literal
  // \\s*\\(           opening bracket with possible spaces
  // .*?title:         lazy match everything until we see title:
  // (?:const\\s+)?    optional "const "
  // Text\\([\'"]([^\'"]+)['"] => capture text in the title
  // .*?content:\\s*\\[(.*?)\\] => then find content: [ ... ] capturing block
  // \\) => the closing parenthesis of StepItem, or possibly StepItem(...,).
  //
  // We also allow extra method calls like .p() or .sized(...) after title:
  // so we have "Text\\([\'"]([^\'"]+)['"]\\)(?:\\.\\w+\\(\\))*" in a more open context
  //
  // Finally, we double-escape backslashes to avoid raw strings.
  final stepItemPattern = RegExp(
    'StepItem\\s*\\(.*?title:\\s*(?:const\\s+)?Text\\([\'"]([^\'"]+)[\'"]\\)(?:\\.\\w+\\(\\))*.*?content:\\s*\\[(.*?)\\].*?\\)',
    dotAll: true,
  );

  final matches = stepItemPattern.allMatches(sourceCode);
  final stepItems = <ParsedStepItem>[];

  for (final match in matches) {
    final stepTitle = match.group(1) ?? 'Untitled Step';
    final contentBlock = match.group(2) ?? '';
    final itemStart = match.start;

    // 1) Extract descriptive text lines from content
    final textPattern = RegExp(
      'Text\\(\\s*[\'"]([^\'"]+)[\'"]\\s*\\)(?:\\.\\w+\\(\\))*',
    );
    final textMatches = textPattern.allMatches(contentBlock);
    final descriptiveLines = <String>[];
    for (final tm in textMatches) {
      final textLine = tm.group(1);
      if (textLine != null) {
        descriptiveLines.add(textLine);
      }
    }

    // 2) Extract code snippets from content
    final codeSnippetPattern = RegExp(
      'CodeSnippet\\(\\s*code:\\s*[\'"]([^\'"]+)[\'"],?\\s*mode:\\s*[\'"]([^\'"]+)[\'"]',
      multiLine: true,
    );
    final snippetMatches = codeSnippetPattern.allMatches(contentBlock);
    final codeSnippets = <_ParsedCodeSnippet>[];
    for (final sm in snippetMatches) {
      final code = sm.group(1) ?? '';
      final mode = sm.group(2) ?? 'text';
      codeSnippets.add(_ParsedCodeSnippet(code, mode));
    }

    stepItems.add(
      ParsedStepItem(
        title: stepTitle,
        descriptiveText: descriptiveLines,
        codeSnippets: codeSnippets,
        itemStart: itemStart,
      ),
    );
  }

  return stepItems;
}

/// ----------------------------------------------------------------------------
/// Other utility functions
/// ----------------------------------------------------------------------------

String formatComponentName(String name) {
  return name.split('_').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
}

String extractExampleCode(String sourceCode) {
  // Remove package imports, but keep relative and dart imports
  final withoutImports = sourceCode.replaceAll(
    RegExp('import\\s+[\'"]package:[^\'";]*[\'"];'),
    '',
  );

  // Normalize double newlines, trim whitespace, etc.
  var cleanedCode = withoutImports.replaceAll(RegExp('\\n{2,}'), '\n').trim();

  // Ensure single newline at the end
  if (!cleanedCode.endsWith('\n')) {
    cleanedCode += '\n';
  }

  return cleanedCode;
}
