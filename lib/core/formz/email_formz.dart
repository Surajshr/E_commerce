import 'package:formz/formz.dart';

enum EmailValidationError { empty, invalid }

class EmailFormz extends FormzInput<String, EmailValidationError> {
  const EmailFormz.pure() : super.pure('');

  const EmailFormz.dirty(super.value) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
  );

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) return EmailValidationError.empty;
    if (!_emailRegExp.hasMatch(value)) return EmailValidationError.invalid;
    return null;
  }
}

extension EmailValidationErrorExplanation on EmailValidationError {
  String get explain {
    switch (this) {
      case EmailValidationError.empty:
        return 'Email cannot be empty';
      case EmailValidationError.invalid:
        return 'Email is invalid';
    }
  }
}
