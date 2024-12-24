# Card

## Examples

```dart
import 'dart:ui';

import 'package:shadcn_flutter/shadcn_flutter.dart';

class CardImageExample1 extends StatelessWidget {
  const CardImageExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < 10; i++)
                CardImage(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Card Image'),
                          content: const Text('You clicked on a card image.'),
                          actions: [
                            PrimaryButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  image: Image.network(
                    'https://picsum.photos/200/300',
                  ),
                  title: Text('Card Number ${i + 1}'),
                  subtitle: const Text('Lorem ipsum dolor sit amet'),
                ),
            ],
          ).gap(8),
        ),
      ),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CardExample1 extends StatelessWidget {
  const CardExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Create project').semiBold(),
          const SizedBox(height: 4),
          const Text('Deploy your new project in one-click').muted().small(),
          const SizedBox(height: 24),
          const Text('Name').semiBold().small(),
          const SizedBox(height: 4),
          const TextField(placeholder: Text('Name of your project')),
          const SizedBox(height: 16),
          const Text('Description').semiBold().small(),
          const SizedBox(height: 4),
          const TextField(placeholder: Text('Description of your project')),
          const SizedBox(height: 24),
          Row(
            children: [
              OutlineButton(
                child: const Text('Cancel'),
                onPressed: () {},
              ),
              const Spacer(),
              PrimaryButton(
                child: const Text('Deploy'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    ).intrinsic();
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class HoverCardExample1 extends StatelessWidget {
  const HoverCardExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      hoverBuilder: (context) {
        return const SurfaceCard(
          child: Basic(
            leading: FlutterLogo(),
            title: Text('@flutter'),
            content: Text(
                'The Flutter SDK provides the tools to build beautiful apps for mobile, web, and desktop from a single codebase.'),
          ),
        ).sized(width: 300);
      },
      child: LinkButton(
        onPressed: () {},
        child: const Text('@flutter'),
      ),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class RadioCardExample1 extends StatefulWidget {
  const RadioCardExample1({super.key});

  @override
  State<RadioCardExample1> createState() => _RadioCardExample1State();
}

class _RadioCardExample1State extends State<RadioCardExample1> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return RadioGroup(
      value: value,
      onChanged: (value) {
        setState(() {
          this.value = value;
        });
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioCard(
            value: 1,
            child: Basic(
              title: Text('8-core CPU'),
              content: Text('32 GB RAM'),
            ),
          ),
          RadioCard(
            value: 2,
            child: Basic(
              title: Text('6-core CPU'),
              content: Text('24 GB RAM'),
            ),
          ),
          RadioCard(
            value: 3,
            child: Basic(
              title: Text('4-core CPU'),
              content: Text('16 GB RAM'),
            ),
          ),
        ],
      ).gap(12),
    );
  }
}

```

