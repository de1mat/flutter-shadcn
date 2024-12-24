# Text Area

## Examples

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class TextAreaExample2 extends StatelessWidget {
  const TextAreaExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextArea(
      initialValue: 'Hello, World!',
      expandableWidth: true,
      initialWidth: 500,
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class TextAreaExample3 extends StatelessWidget {
  const TextAreaExample3({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextArea(
      initialValue: 'Hello, World!',
      expandableWidth: true,
      expandableHeight: true,
      initialWidth: 500,
      initialHeight: 300,
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class TextAreaExample1 extends StatelessWidget {
  const TextAreaExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextArea(
      initialValue: 'Hello, World!',
      expandableHeight: true,
      initialHeight: 300,
    );
  }
}

```

