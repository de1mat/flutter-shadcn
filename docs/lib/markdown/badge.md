# Badge

## Examples

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class BadgeExample1 extends StatelessWidget {
  const BadgeExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return const PrimaryBadge(
      child: Text('Primary'),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class BadgeExample2 extends StatelessWidget {
  const BadgeExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return const SecondaryBadge(
      child: Text('Secondary'),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class BadgeExample3 extends StatelessWidget {
  const BadgeExample3({super.key});

  @override
  Widget build(BuildContext context) {
    return const OutlineBadge(
      child: Text('Outline'),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class BadgeExample4 extends StatelessWidget {
  const BadgeExample4({super.key});

  @override
  Widget build(BuildContext context) {
    return const DestructiveBadge(
      child: Text('Destructive'),
    );
  }
}

```

