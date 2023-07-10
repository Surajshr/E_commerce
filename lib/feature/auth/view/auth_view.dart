import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping_application/feature/auth/logic/auth_provider.dart';
import 'package:shopping_application/feature/auth/view/widgets/email_input.dart';
import 'package:shopping_application/feature/auth/view/widgets/password_input.dart';
import 'package:shopping_application/feature/auth/view/widgets/submiot_button.dart';
import 'package:shopping_application/ui/app_color.dart';
import 'package:shopping_application/ui/app_text_styles.dart';
import 'package:shopping_application/ui/src/gap.dart';
import 'package:shopping_application/utils/common_utils.dart';

class AuthView extends ConsumerStatefulWidget {
  const AuthView({super.key});

  @override
  ConsumerState<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends ConsumerState<AuthView> {
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _conformFocusNode;
  late AuthViewModel viewModel;
  late StreamSubscription<User?> _subscription;
  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _conformFocusNode = FocusNode();
    viewModel = ref.read(authViewModelProvider.notifier);
    viewModel.cheAuthState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authViewModelProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 1.sh,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  viewModel.isSignInForm ? 'Sign In' : 'Sign Up',
                  style: AppTextStyles.titleMedium,
                ),
                gapH36,
                Text(
                  viewModel.isSignInForm
                      ? 'Welcome Back'
                      : "Create your Account",
                  style: AppTextStyles.titleLarge,
                ),
                gapH8,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    viewModel.isSignInForm
                        ? 'Sign in your email and password or continue with social media'
                        : 'Create your account for exciting offer in all products or continue with social media',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: ColorAssets.disabledText,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                gapH36,
                EmailInput(
                  emailFocusNode: _emailFocusNode,
                  passwordFocusNode: _passwordFocusNode,
                ),
                gapH12,
                const PasswordInput(),
                gapH4,
                viewModel.isSignInForm
                    ? InkWell(
                        onTap: () {
                          dPrint("you click forget Password");
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forget Password",
                            style: AppTextStyles.labelSmall,
                          ),
                        ),
                      )
                    : gapH12,
                gapH16,
                const SubmitButton(),
                gapH36,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      viewModel.isSignInForm
                          ? 'Don\'t have an account? '
                          : 'Already have an account?',
                      style: AppTextStyles.bodyMedium,
                    ),
                    GestureDetector(
                      onTap: () {
                        dPrint(
                          ("signUp button clicked"),
                        );
                        viewModel.changeFormType(
                          viewModel.isSignInForm
                              ? EmailPasswordSignInFormType.register
                              : EmailPasswordSignInFormType.signIn,
                        );
                      },
                      child: Text(
                        viewModel.isSignInForm ? ' Sign Up' : ' Sign In',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: ColorAssets.primary,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
