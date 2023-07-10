import 'package:formz/formz.dart';

enum AuthPasswordValidationError { empty, passwordTooShort, invalid }

class PasswordFormz
    extends FormzInput<String, AuthPasswordValidationError> {
  const PasswordFormz.pure() : super.pure('');

  const PasswordFormz.dirty(super.value) : super.dirty();

  @override
  AuthPasswordValidationError? validator(String value) {
    if (value.isEmpty)
      return AuthPasswordValidationError.empty;
    else if (value.length < 8)
      return AuthPasswordValidationError.passwordTooShort;
    else if (!RegExp(
        r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s)')
        .hasMatch(value)) return AuthPasswordValidationError.invalid;

    return null;
  }
}

extension AuthPasswordValidationErrorExplanation
on AuthPasswordValidationError {
  String get explain {
    switch (this) {
      case AuthPasswordValidationError.empty:
        return 'Password cannot be empty';
      case AuthPasswordValidationError.passwordTooShort:
        return 'Must be atleast 8 characters';
      case AuthPasswordValidationError.invalid:
        return 'Include small, capital, number & special character';
    }
  }
}
