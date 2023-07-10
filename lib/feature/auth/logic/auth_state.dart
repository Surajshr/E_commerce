part of 'auth_provider.dart';


enum EmailPasswordSignInFormType { signIn, register }

extension Validator on AppAuthState {
  FormzStatus get status => Formz.validate([
    email,
    password,
    // if (formType != EmailPasswordSignInFormType.signIn) confirmPassword,
  ]);
}

@freezed
class AppAuthState with _$AppAuthState {
  const factory AppAuthState({
    @Default(EmailFormz.pure()) EmailFormz email,
    @Default(PasswordFormz.pure()) PasswordFormz password,
    @Default(EmailPasswordSignInFormType.signIn)
    EmailPasswordSignInFormType formType,
    @Default(false) bool isLoading,
    @Default(false) bool isLoggedIn,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool isConfirmPasswordVisible,
    @Default(false) bool isEmailInitiallyInitialized,
    @Default('') String error,
  }) = _AppAuthState;
}
