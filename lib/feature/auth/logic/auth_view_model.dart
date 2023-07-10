part of 'auth_provider.dart';

class AuthViewModel extends StateNotifier<AppAuthState> {
  AuthViewModel({
    required this.goRouter,
  }) : super(const AppAuthState());
  final GoRouter goRouter;
  final _emailTextController = TextEditingController();
  final _passwordController = TextEditingController();

  TextEditingController get emailTextController => _emailTextController;

  TextEditingController get passwordController => _passwordController;

  bool get isSignInForm => state.formType == EmailPasswordSignInFormType.signIn;

  Future<String> performLogin({
    required BuildContext context,
  }) async {
    dPrint('EnteredEmail:${state.email.value}');
    dPrint('EnteredPassword:${state.password.value}');
    state = state.copyWith(
      isLoading: true,
    );
    try {
      final respond =
          isSignInForm ? await performSignIn() : await performSignUp();
      dPrint("respond from register user:$respond");
      state = state.copyWith(
        isLoading: false,
      );

      return respond;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
      );
      dPrint('failed to register USer $e');
      return 'Failed to create account';
    }
  }

  Future<String> performSignUp() async {
    dPrint('EnteredEmail:${state.email.value}');
    dPrint('EnteredPassword:${state.password.value}');
    try {
      final respond = await firebaseService.createAccount(
        userEmail: state.email.value,
        password: state.password.value,
      );
      dPrint("respond from register user:$respond");
      return respond;
    } catch (e) {
      dPrint('failed to register USer $e');
      return 'Failed to create account';
    }
  }

  Future<String> performSignIn() async {
    dPrint('EnteredEmail:${state.email.value}');
    dPrint('EnteredPassword:${state.password.value}');
    try {
      final respond = await firebaseService.loginUserWithEmail(
        userEmail: state.email.value,
        password: state.password.value,
      );
      dPrint("respond from register user:$respond");
      return respond;
    } catch (e) {
      dPrint('failed to register USer $e');
      return 'Failed to create account';
    }
  }

  final firebaseService = locator<FirebaseService>();

  void changeFormType(EmailPasswordSignInFormType formType) {
    _passwordController.clear();
    _emailTextController.clear();
    state = state.copyWith(
      formType: formType,
      email: const EmailFormz.pure(),
      password: const PasswordFormz.pure(),
      isEmailInitiallyInitialized: false,
    );
  }

  Future<void> cheAuthState() async {
    String user;
    user = await firebaseService.checkAuthStateChange();
    dPrint('user respond detail while login:$user');
  }

  void onEmailChanged(String value) {
    final email = EmailFormz.dirty(value);
    state = state.copyWith(
      email: email,
      password: state.password,
      error: '',
    );
  }

  void showSnackBar({
    required BuildContext context,
    required String message,
  }) {
    final bool isSuccess = (message == 'success') ? true : false;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: isSuccess ? ColorAssets.success : ColorAssets.error,
        content: Text(message),
      ),
    );
  }

  void onPasswordChanged(String value) {
    final password = PasswordFormz.dirty(
      value,
    );
    if (state.password.value.length > 7) {
      state = state.copyWith(
        password: password,
        email: state.email,
        error: '',
      );
    } else {
      state = state.copyWith(
        password: password,
        email: state.email,
        error: '',
      );
    }
  }

  void setInitialEmailStateChanged(
      {required bool isEmailInitialized, required String userEmail}) {
    final email = EmailFormz.dirty(userEmail);
    state = state.copyWith(
      isEmailInitiallyInitialized: isEmailInitialized,
      email: email,
      password: state.password,
      error: '',
    );
  }

  void changePasswordVisibility() {
    state = state.copyWith(
      isPasswordVisible: !state.isPasswordVisible,
      error: '',
    );
  }
}
