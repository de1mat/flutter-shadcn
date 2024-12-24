# Progress

## Examples

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class ProgressExample1 extends StatefulWidget {
  const ProgressExample1({super.key});

  @override
  State<ProgressExample1> createState() => _ProgressExample1State();
}

class _ProgressExample1State extends State<ProgressExample1> {
  double _progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 400,
          child: Progress(
            progress: _progress.clamp(0, 100),
            min: 0,
            max: 100,
          ),
        ),
        const Gap(16),
        Row(
          children: [
            DestructiveButton(
              onPressed: () {
                setState(() {
                  _progress = 0;
                });
              },
              child: const Text('Reset'),
            ),
            const Gap(16),
            PrimaryButton(
              onPressed: () {
                if (_progress > 0) {
                  setState(() {
                    _progress -= 10;
                  });
                }
              },
              child: const Text('Decrease by 10'),
            ),
            const Gap(16),
            PrimaryButton(
              onPressed: () {
                if (_progress < 100) {
                  setState(() {
                    _progress += 10;
                  });
                }
              },
              child: const Text('Increase by 10'),
            ),
          ],
        )
      ],
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CircularProgressExample2 extends StatefulWidget {
  const CircularProgressExample2({super.key});

  @override
  State<CircularProgressExample2> createState() =>
      _CircularProgressExample2State();
}

class _CircularProgressExample2State extends State<CircularProgressExample2> {
  double _progress = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          value: _progress.clamp(0, 100) / 100,
          size: 48,
        ),
        const Gap(48),
        Row(
          children: [
            DestructiveButton(
              onPressed: () {
                setState(() {
                  _progress = 0;
                });
              },
              child: const Text('Reset'),
            ),
            const Gap(16),
            PrimaryButton(
              onPressed: () {
                setState(() {
                  _progress -= 10;
                });
              },
              child: const Text('Decrease by 10'),
            ),
            const Gap(16),
            PrimaryButton(
              onPressed: () {
                setState(() {
                  _progress += 10;
                });
              },
              child: const Text('Increase by 10'),
            ),
          ],
        )
      ],
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class CircularProgressExample1 extends StatelessWidget {
  const CircularProgressExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class LinearProgressExample1 extends StatelessWidget {
  const LinearProgressExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      child: LinearProgressIndicator(),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class LinearProgressExample2 extends StatefulWidget {
  const LinearProgressExample2({super.key});

  @override
  State<LinearProgressExample2> createState() => _LinearProgressExample2State();
}

class _LinearProgressExample2State extends State<LinearProgressExample2> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 200,
          child: LinearProgressIndicator(
            value: value,
          ),
        ),
        const Gap(24),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              onPressed: () {
                setState(() {
                  value = 0;
                });
              },
              child: const Text('Reset'),
            ),
            const Gap(24),
            PrimaryButton(
              onPressed: () {
                if (value + 0.1 >= 1) {
                  return;
                }
                setState(() {
                  value += 0.1;
                });
              },
              child: const Text('Increase'),
            ),
            const Gap(24),
            PrimaryButton(
              onPressed: () {
                if (value - 0.1 <= 0) {
                  return;
                }
                setState(() {
                  value -= 0.1;
                });
              },
              child: const Text('Decrease'),
            ),
          ],
        )
      ],
    );
  }
}

```

