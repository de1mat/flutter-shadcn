# Button

## Examples

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample16 extends StatelessWidget {
  const ButtonExample16({super.key});

  @override
  Widget build(BuildContext context) {
    return CardButton(
      onPressed: () {},
      child: const Basic(
        title: Text('Project #1'),
        subtitle: Text('Project description'),
        content:
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
      ),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample6 extends StatelessWidget {
  const ButtonExample6({super.key});

  @override
  Widget build(BuildContext context) {
    return LinkButton(
      onPressed: () {},
      child: const Text('Link'),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample7 extends StatelessWidget {
  const ButtonExample7({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        PrimaryButton(
          child: Text('Disabled'),
        ),
        SecondaryButton(
          child: Text('Disabled'),
        ),
        OutlineButton(
          child: Text('Disabled'),
        ),
        GhostButton(
          child: Text('Disabled'),
        ),
        TextButton(
          child: Text('Disabled'),
        ),
        DestructiveButton(
          child: Text('Disabled'),
        ),
      ],
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample10 extends StatelessWidget {
  const ButtonExample10({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        PrimaryButton(
          size: ButtonSize.xSmall,
          onPressed: () {},
          child: const Text('Extra Small'),
        ),
        PrimaryButton(
          onPressed: () {},
          size: ButtonSize.small,
          child: const Text('Small'),
        ),
        PrimaryButton(
          size: ButtonSize.normal,
          onPressed: () {},
          child: const Text('Normal'),
        ),
        PrimaryButton(
          size: ButtonSize.large,
          onPressed: () {},
          child: const Text('Large'),
        ),
        PrimaryButton(
          size: ButtonSize.xLarge,
          onPressed: () {},
          child: const Text('Extra Large'),
        ),
      ],
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample1 extends StatelessWidget {
  const ButtonExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: () {},
      child: const Text('Primary'),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample11 extends StatelessWidget {
  const ButtonExample11({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        PrimaryButton(
          onPressed: () {},
          density: ButtonDensity.compact,
          child: const Text('Compact'),
        ),
        PrimaryButton(
          onPressed: () {},
          density: ButtonDensity.dense,
          child: const Text('Dense'),
        ),
        PrimaryButton(
          onPressed: () {},
          density: ButtonDensity.normal,
          child: const Text('Normal'),
        ),
        PrimaryButton(
          onPressed: () {},
          density: ButtonDensity.comfortable,
          child: const Text('Comfortable'),
        ),
        PrimaryButton(
          onPressed: () {},
          density: ButtonDensity.icon,
          child: const Text('Icon'),
        ),
        PrimaryButton(
          onPressed: () {},
          density: ButtonDensity.iconComfortable,
          child: const Text('Icon Comfortable'),
        ),
      ],
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample2 extends StatelessWidget {
  const ButtonExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryButton(
      onPressed: () {},
      child: const Text('Secondary'),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample12 extends StatelessWidget {
  const ButtonExample12({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: const Text('Text Button'),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample13 extends StatelessWidget {
  const ButtonExample13({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        PrimaryButton(
          onPressed: () {},
          shape: ButtonShape.circle,
          child: const Icon(Icons.add),
        ),
        PrimaryButton(
          onPressed: () {},
          shape: ButtonShape.rectangle,
          child: const Text('Rectangle'),
        ),
      ],
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample3 extends StatelessWidget {
  const ButtonExample3({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () {},
      child: const Text('Outlined'),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample4 extends StatelessWidget {
  const ButtonExample4({super.key});

  @override
  Widget build(BuildContext context) {
    return GhostButton(
      onPressed: () {},
      child: const Text('Ghost'),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample14 extends StatelessWidget {
  const ButtonExample14({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonGroup(
      children: [
        PrimaryButton(
          child: const Text('Primary'),
          onPressed: () {},
        ),
        SecondaryButton(
          child: const Text('Secondary'),
          onPressed: () {},
        ),
        DestructiveButton(
          child: const Text('Destructive'),
          onPressed: () {},
        ),
        OutlineButton(
          child: const Text('Outlined'),
          onPressed: () {},
        ),
        GhostButton(
          child: const Text('Ghost'),
          onPressed: () {},
        ),
        IconButton.primary(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
      ],
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample8 extends StatelessWidget {
  const ButtonExample8({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: [
        IconButton.primary(
          onPressed: () {},
          density: ButtonDensity.icon,
          icon: const Icon(Icons.add),
        ),
        IconButton.secondary(
          onPressed: () {},
          density: ButtonDensity.icon,
          icon: const Icon(Icons.add),
        ),
        IconButton.outline(
          onPressed: () {},
          density: ButtonDensity.icon,
          icon: const Icon(Icons.add),
        ),
        IconButton.ghost(
          onPressed: () {},
          density: ButtonDensity.icon,
          icon: const Icon(Icons.add),
        ),
        IconButton.text(
          onPressed: () {},
          density: ButtonDensity.icon,
          icon: const Icon(Icons.add),
        ),
        IconButton.destructive(
          onPressed: () {},
          density: ButtonDensity.icon,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample9 extends StatelessWidget {
  const ButtonExample9({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        PrimaryButton(
          onPressed: () {},
          trailing: const Icon(Icons.add),
          child: const Text('Add'),
        ),
        SecondaryButton(
          onPressed: () {},
          trailing: const Icon(Icons.add),
          child: const Text('Add'),
        ),
        OutlineButton(
          onPressed: () {},
          trailing: const Icon(Icons.add),
          child: const Text('Add'),
        ),
        GhostButton(
          onPressed: () {},
          trailing: const Icon(Icons.add),
          child: const Text('Add'),
        ),
        TextButton(
          onPressed: () {},
          trailing: const Icon(Icons.add),
          child: const Text('Add'),
        ),
        DestructiveButton(
          onPressed: () {},
          trailing: const Icon(Icons.add),
          child: const Text('Add'),
        ),
      ],
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample15 extends StatelessWidget {
  const ButtonExample15({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      leading: const StatedWidget.map(
        states: {
          'disabled': Icon(Icons.close),
          {WidgetState.hovered, WidgetState.focused}:
              Icon(Icons.add_a_photo_rounded),
          WidgetState.hovered: Icon(Icons.add_a_photo),
        },
        child: Icon(Icons.add_a_photo_outlined),
      ),
      onPressed: () {},
      child: const StatedWidget(
        focused: Text('Focused'),
        hovered: Text('Hovered'),
        pressed: Text('Pressed'),
        child: Text('Normal'),
      ),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ButtonExample5 extends StatelessWidget {
  const ButtonExample5({super.key});

  @override
  Widget build(BuildContext context) {
    return DestructiveButton(
      onPressed: () {},
      child: const Text('Destructive'),
    );
  }
}

```

