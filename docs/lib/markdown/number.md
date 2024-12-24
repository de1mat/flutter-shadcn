# Number

## Examples

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class NumberInputExample1 extends StatefulWidget {
  const NumberInputExample1({super.key});

  @override
  State<NumberInputExample1> createState() => _NumberInputExample1State();
}

class _NumberInputExample1State extends State<NumberInputExample1> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          child: NumberInput(
            initialValue: value,
            onChanged: (value) {
              setState(() {
                this.value = value;
              });
            },
          ),
        ),
        gap(8),
        Text('Value: $value'),
      ],
    );
  }
}

```

```dart
import 'package:intl/intl.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class NumberTickerExample1 extends StatefulWidget {
  const NumberTickerExample1({super.key});

  @override
  State<NumberTickerExample1> createState() => _NumberTickerExample1State();
}

class _NumberTickerExample1State extends State<NumberTickerExample1> {
  int _number = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NumberTicker(
          initialNumber: 0,
          number: _number,
          style: const TextStyle(fontSize: 32),
          formatter: (number) {
            return NumberFormat.compact().format(number);
          },
        ),
        const Gap(24),
        TextField(
          initialValue: _number.toString(),
          controller: _controller,
          onEditingComplete: () {
            int? number = int.tryParse(_controller.text);
            if (number != null) {
              setState(() {
                _number = number;
              });
            }
          },
        )
      ],
    );
  }
}

```

