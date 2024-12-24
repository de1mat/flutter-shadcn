# Avatar

## Examples

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AvatarExample1 extends StatelessWidget {
  const AvatarExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return Avatar(
      backgroundColor: Colors.red,
      initials: Avatar.getInitials('sunarya-thito'),
      provider: const NetworkImage(
          'https://avatars.githubusercontent.com/u/64018564?v=4'),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AvatarExample2 extends StatelessWidget {
  const AvatarExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Avatar(
      initials: Avatar.getInitials('sunarya-thito'),
      size: 64,
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AvatarExample3 extends StatelessWidget {
  const AvatarExample3({super.key});

  @override
  Widget build(BuildContext context) {
    return Avatar(
      initials: Avatar.getInitials('sunarya-thito'),
      size: 64,
      badge: const AvatarBadge(
        size: 20,
        color: Colors.green,
      ),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class AvatarGroupExample1 extends StatefulWidget {
  const AvatarGroupExample1({super.key});

  @override
  State<AvatarGroupExample1> createState() => _AvatarGroupExample1State();
}

class _AvatarGroupExample1State extends State<AvatarGroupExample1> {
  List<AvatarWidget> getAvatars() {
    return [
      Avatar(
        initials: Avatar.getInitials('sunarya-thito'),
        backgroundColor: Colors.red,
      ),
      Avatar(
        initials: Avatar.getInitials('sunarya-thito'),
        backgroundColor: Colors.green,
      ),
      Avatar(
        initials: Avatar.getInitials('sunarya-thito'),
        backgroundColor: Colors.blue,
      ),
      Avatar(
        initials: Avatar.getInitials('sunarya-thito'),
        backgroundColor: Colors.yellow,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        AvatarGroup.toLeft(children: getAvatars()),
        AvatarGroup.toRight(children: getAvatars()),
        AvatarGroup.toTop(children: getAvatars()),
        AvatarGroup.toBottom(children: getAvatars()),
      ],
    );
  }
}

```

