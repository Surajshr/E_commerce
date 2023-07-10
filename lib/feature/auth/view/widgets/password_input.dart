import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_application/common/widgets/custom_text_field.dart';
import 'package:shopping_application/feature/auth/logic/auth_provider.dart';
import 'package:shopping_application/core/formz/password_formz.dart';

import '../../../../ui/app_color.dart';


class PasswordInput extends ConsumerWidget {
  const PasswordInput({
    Key? key,

  }) : super(key: key);



  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final viewModel = ref.read(authViewModelProvider.notifier);
    final state = ref.watch(authViewModelProvider);
    return CustomTextField(
      controller: viewModel.passwordController,
      obscureText: !state.isPasswordVisible,
      onChanged: viewModel.onPasswordChanged,
      errorText:
      state.password.invalid ? state.password.error?.explain : null,
      onTap: () {
        viewModel.setInitialEmailStateChanged(
          isEmailInitialized: true,
          userEmail: viewModel.emailTextController.text,
        );
      },
      labelText: 'Password',
      suffixIcon: IconButton(
        icon: state.isPasswordVisible
            ? Icon(
          Icons.visibility,
          size: 24.0,
          color: ColorAssets.onBackground,
        )
            : Icon(
          Icons.visibility_off_outlined,
          size: 24.0,
          color: ColorAssets.onBackground,
        ),
        onPressed: viewModel.changePasswordVisibility,
      ),
    );
  }
}