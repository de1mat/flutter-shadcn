# Input Otp

## Examples

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class InputOTPExample4 extends StatelessWidget {
  const InputOTPExample4({super.key});

  @override
  Widget build(BuildContext context) {
    return InputOTP(
      children: [
        InputOTPChild.character(
            allowLowercaseAlphabet: true,
            allowUppercaseAlphabet: true,
            onlyUppercaseAlphabet: true),
        InputOTPChild.character(
            allowLowercaseAlphabet: true,
            allowUppercaseAlphabet: true,
            onlyUppercaseAlphabet: true),
        InputOTPChild.character(
            allowLowercaseAlphabet: true,
            allowUppercaseAlphabet: true,
            onlyUppercaseAlphabet: true),
        InputOTPChild.separator,
        InputOTPChild.character(
            allowLowercaseAlphabet: true,
            allowUppercaseAlphabet: true,
            onlyUppercaseAlphabet: true),
        InputOTPChild.character(
            allowLowercaseAlphabet: true,
            allowUppercaseAlphabet: true,
            onlyUppercaseAlphabet: true),
        InputOTPChild.character(
            allowLowercaseAlphabet: true,
            allowUppercaseAlphabet: true,
            onlyUppercaseAlphabet: true),
        InputOTPChild.separator,
        InputOTPChild.character(
            allowLowercaseAlphabet: true,
            allowUppercaseAlphabet: true,
            onlyUppercaseAlphabet: true),
        InputOTPChild.character(
            allowLowercaseAlphabet: true,
            allowUppercaseAlphabet: true,
            onlyUppercaseAlphabet: true),
        InputOTPChild.character(
            allowLowercaseAlphabet: true,
            allowUppercaseAlphabet: true,
            onlyUppercaseAlphabet: true),
      ],
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class InputOTPExample2 extends StatelessWidget {
  const InputOTPExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return InputOTP(
      initialValue: '123'.codeUnits,
      children: [
        InputOTPChild.character(allowDigit: true),
        InputOTPChild.character(allowDigit: true),
        InputOTPChild.character(allowDigit: true),
        InputOTPChild.separator,
        InputOTPChild.character(allowDigit: true),
        InputOTPChild.character(allowDigit: true),
        InputOTPChild.character(allowDigit: true),
      ],
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class InputOTPExample3 extends StatelessWidget {
  const InputOTPExample3({super.key});

  @override
  Widget build(BuildContext context) {
    return InputOTP(
      children: [
        InputOTPChild.character(allowDigit: true, obscured: true),
        InputOTPChild.character(allowDigit: true, obscured: true),
        InputOTPChild.character(allowDigit: true, obscured: true),
        InputOTPChild.separator,
        InputOTPChild.character(allowDigit: true, obscured: true),
        InputOTPChild.character(allowDigit: true, obscured: true),
        InputOTPChild.character(allowDigit: true, obscured: true),
      ],
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class InputOTPExample1 extends StatefulWidget {
  const InputOTPExample1({super.key});

  @override
  State<InputOTPExample1> createState() => _InputOTPExample1State();
}

class _InputOTPExample1State extends State<InputOTPExample1> {
  String value = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InputOTP(
          onChanged: (value) {
            setState(() {
              this.value = value.otpToString();
            });
          },
          children: [
            InputOTPChild.character(allowDigit: true),
            InputOTPChild.character(allowDigit: true),
            InputOTPChild.character(allowDigit: true),
            InputOTPChild.separator,
            InputOTPChild.character(allowDigit: true),
            InputOTPChild.character(allowDigit: true),
            InputOTPChild.character(allowDigit: true),
          ],
        ),
        gap(16),
        Text('Value: $value'),
      ],
    );
  }
}

```

