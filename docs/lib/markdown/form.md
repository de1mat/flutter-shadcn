# Form

## Examples

```dart
import 'dart:convert';

import 'package:shadcn_flutter/shadcn_flutter.dart';

class FormExample1 extends StatefulWidget {
  const FormExample1({super.key});

  @override
  State<FormExample1> createState() => _FormExample1State();
}

class _FormExample1State extends State<FormExample1> {
  final _usernameKey = const FormKey<String>('username');
  final _passwordKey = const FormKey<String>('password');
  final _confirmPasswordKey = const FormKey<String>('confirmPassword');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 480,
      child: Form(
        onSubmit: (context, values) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Form Values'),
                content: Text(jsonEncode(values.map(
                  (key, value) {
                    return MapEntry(key.key, value);
                  },
                ))),
                actions: [
                  PrimaryButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FormTableLayout(
              rows: [
                FormField<String>(
                  key: _usernameKey,
                  label: const Text('Username'),
                  hint: const Text('This is your public display name'),
                  validator: const LengthValidator(min: 4),
                  child: const TextField(
                    initialValue: 'sunarya-thito',
                  ),
                ),
                FormField<String>(
                  key: _passwordKey,
                  label: const Text('Password'),
                  validator: const LengthValidator(min: 8),
                  child: const TextField(
                    obscureText: true,
                  ),
                ),
                FormField<String>(
                  key: _confirmPasswordKey,
                  label: const Text('Confirm Password'),
                  validator: CompareWith.equal(_passwordKey,
                      message: 'Passwords do not match'),
                  child: const TextField(
                    obscureText: true,
                  ),
                ),
              ],
            ),
            const Gap(24),
            FormErrorBuilder(
              builder: (context, errors, child) {
                return PrimaryButton(
                  onPressed: errors.isEmpty ? () => context.submitForm() : null,
                  child: const Text('Submit'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

```

```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';

class FormExample2 extends StatefulWidget {
  const FormExample2({super.key});

  @override
  State<FormExample2> createState() => _FormExample2State();
}

class _FormExample2State extends State<FormExample2> {
  final _usernameKey = const FormKey<String>(#username);
  final _passwordKey = const FormKey<String>(#password);
  final _confirmPasswordKey = const FormKey<String>(#confirmPassword);
  final _agreeKey = const FormKey<CheckboxState>(#agree);
  CheckboxState state = CheckboxState.unchecked;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 480,
      child: Form(
        onSubmit: (context, values) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Form Values'),
                content: Text(values.toString()),
                actions: [
                  PrimaryButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormField<String>(
                  key: _usernameKey,
                  label: const Text('Username'),
                  hint: const Text('This is your public display name'),
                  validator: const LengthValidator(min: 4),
                  showErrors: const {
                    FormValidationMode.changed,
                    FormValidationMode.submitted
                  },
                  child: const TextField(),
                ),
                FormField<String>(
                  key: _passwordKey,
                  label: const Text('Password'),
                  validator: const LengthValidator(min: 8),
                  showErrors: const {
                    FormValidationMode.changed,
                    FormValidationMode.submitted
                  },
                  child: const TextField(
                    obscureText: true,
                  ),
                ),
                FormField<String>(
                  key: _confirmPasswordKey,
                  label: const Text('Confirm Password'),
                  validator: CompareWith.equal(_passwordKey,
                      message: 'Passwords do not match'),
                  showErrors: const {
                    FormValidationMode.changed,
                    FormValidationMode.submitted
                  },
                  child: const TextField(
                    obscureText: true,
                  ),
                ),
                FormInline<CheckboxState>(
                  key: _agreeKey,
                  label: const Text('I agree to the terms and conditions'),
                  validator: const CompareTo.equal(CheckboxState.checked,
                      message: 'You must agree to the terms and conditions'),
                  showErrors: const {
                    FormValidationMode.changed,
                    FormValidationMode.submitted
                  },
                  child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Checkbox(
                        state: state,
                        onChanged: (value) {
                          setState(() {
                            state = value;
                          });
                        }),
                  ),
                ),
              ],
            ).gap(24),
            const Gap(24),
            FormErrorBuilder(
              builder: (context, errors, child) {
                return PrimaryButton(
                  onPressed: errors.isEmpty ? () => context.submitForm() : null,
                  child: const Text('Submit'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

```

```dart
import 'dart:convert';

import 'package:shadcn_flutter/shadcn_flutter.dart';

class FormExample3 extends StatefulWidget {
  const FormExample3({super.key});

  @override
  State<FormExample3> createState() => _FormExample3State();
}

class _FormExample3State extends State<FormExample3> {
  final _dummyData = [
    'sunarya-thito',
    'septogeddon',
    'shadcn',
  ];

  final _usernameKey = const FormKey<String>('username');
  final _passwordKey = const FormKey<String>('password');
  final _confirmPasswordKey = const FormKey<String>('confirmPassword');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 480,
      child: Form(
        onSubmit: (context, values) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Form Values'),
                content: Text(jsonEncode(values.map(
                  (key, value) {
                    return MapEntry(key.key, value);
                  },
                ))),
                actions: [
                  PrimaryButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FormTableLayout(
              rows: [
                FormField<String>(
                  key: _usernameKey,
                  label: const Text('Username'),
                  hint: const Text('This is your public display name'),
                  validator: const LengthValidator(min: 4) &
                      ValidationMode(
                        ConditionalValidator((value) async {
                          // simulate a network delay for example purpose
                          await Future.delayed(const Duration(seconds: 1));
                          return !_dummyData.contains(value);
                        }, message: 'Username already taken'),
                        // only validate when the form is submitted
                        mode: {FormValidationMode.submitted},
                      ),
                  child: const TextField(
                    initialValue: 'sunarya-thito',
                  ),
                ),
                FormField<String>(
                  key: _passwordKey,
                  label: const Text('Password'),
                  validator: const LengthValidator(min: 8),
                  showErrors: const {
                    FormValidationMode.submitted,
                    FormValidationMode.changed
                  },
                  child: const TextField(
                    obscureText: true,
                  ),
                ),
                FormField<String>(
                  key: _confirmPasswordKey,
                  label: const Text('Confirm Password'),
                  showErrors: const {
                    FormValidationMode.submitted,
                    FormValidationMode.changed
                  },
                  validator: CompareWith.equal(_passwordKey,
                      message: 'Passwords do not match'),
                  child: const TextField(
                    obscureText: true,
                  ),
                ),
              ],
            ),
            const Gap(24),
            const SubmitButton(
              loadingTrailing: AspectRatio(
                aspectRatio: 1,
                child: CircularProgressIndicator(
                  onSurface: true,
                ),
              ),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

```

