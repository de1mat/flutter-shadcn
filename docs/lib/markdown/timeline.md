# Timeline

## Examples

```dart
import 'dart:math';

import 'package:shadcn_flutter/shadcn_flutter.dart';

class TimelineAnimationExample1 extends StatefulWidget {
  const TimelineAnimationExample1({super.key});

  @override
  State<TimelineAnimationExample1> createState() =>
      _TimelineAnimationExample1State();
}

class _TimelineAnimationExample1State extends State<TimelineAnimationExample1>
    with SingleTickerProviderStateMixin {
  final TimelineAnimation<Offset> offsetTimeline = TimelineAnimation(
    keyframes: [
      const AbsoluteKeyframe(
        Duration(seconds: 1),
        Offset(-100, -100),
        Offset(100, -100),
      ),
      const RelativeKeyframe(
        Duration(seconds: 2),
        Offset(100, 100),
      ),
      const RelativeKeyframe(
        Duration(seconds: 1),
        Offset(-100, 100),
      ),
      const RelativeKeyframe(
        Duration(seconds: 2),
        Offset(-100, -100),
      ),
    ],
    lerp: Transformers.typeOffset,
  );
  final TimelineAnimation<double> rotationTimeline = TimelineAnimation(
    keyframes: [
      const AbsoluteKeyframe(
        Duration(seconds: 1),
        0,
        pi / 2,
      ),
      const StillKeyframe(
        Duration(seconds: 2),
      ),
      const RelativeKeyframe(
        Duration(seconds: 1),
        0,
      ),
      const StillKeyframe(
        Duration(seconds: 2),
      ),
    ],
    lerp: Transformers.typeDouble,
  );

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: timelineMaxDuration([
        offsetTimeline,
        rotationTimeline,
      ]),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: offsetTimeline.transform(controller.value),
          child: Transform.rotate(
            angle: rotationTimeline.transform(controller.value),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class TimelineExample1 extends StatelessWidget {
  const TimelineExample1({super.key});

  @override
  Widget build(BuildContext context) {
    return Timeline(
      data: [
        TimelineData(
          time: const Text('2022-01-01'),
          title: const Text('First event'),
          content: const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Odio euismod lacinia at quis risus sed vulputate odio ut. Quam viverra orci sagittis eu volutpat odio facilisis mauris.'),
        ),
        TimelineData(
          time: const Text('2022-01-02'),
          title: const Text('Second event'),
          content: const Text(
              'Aut eius excepturi ex recusandae eius est minima molestiae. Nam dolores iusto ad fugit reprehenderit hic dolorem quisquam et quia omnis non suscipit nihil sit libero distinctio. Ad dolorem tempora sit nostrum voluptatem qui tempora unde? Sit rerum magnam nam ipsam nesciunt aut rerum necessitatibus est quia esse non magni quae.'),
        ),
        TimelineData(
          time: const Text('2022-01-03'),
          title: const Text('Third event'),
          content: const Text(
            'Sit culpa quas ex nulla animi qui deleniti minus rem placeat mollitia. Et enim doloremque et quia sequi ea dolores voluptatem ea rerum vitae. Aut itaque incidunt est aperiam vero sit explicabo fuga id optio quis et molestiae nulla ex quae quam. Ab eius dolores ab tempora dolorum eos beatae soluta At ullam placeat est incidunt cumque.',
          ),
        ),
      ],
    );
  }
}

```

