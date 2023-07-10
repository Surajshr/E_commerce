import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_application/core/formz/email_formz.dart';

import '../../../../common/widgets/custom_text_field.dart';
import '../../../../ui/app_color.dart';
import '../../logic/auth_provider.dart';

class EmailInput extends ConsumerWidget {
  const EmailInput({
    Key? key,
    required FocusNode emailFocusNode,
    required FocusNode passwordFocusNode,
  })  : _emailFocusNode = emailFocusNode,
        _passwordFocusNode = passwordFocusNode,
        super(key: key);

  final FocusNode _emailFocusNode;
  final FocusNode _passwordFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(authViewModelProvider.notifier);
    final state = ref.watch(authViewModelProvider);
    return CustomTextField(
      suffixIcon: Icon(
        Icons.email_outlined,
        color: ColorAssets.onBackground,
      ),
      focusNode: _emailFocusNode,
      controller: viewModel.emailTextController,
      onChanged:
          state.isEmailInitiallyInitialized ? viewModel.onEmailChanged : null,
      labelText: 'Enter Email',
      onFieldSubmitted: (value) {
        viewModel.setInitialEmailStateChanged(
          isEmailInitialized: true,
          userEmail: value,
        );
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      },
      // onTap: onTap,
      errorText: state.email.invalid ? state.email.error?.explain : null,
      keyBoardType: TextInputType.emailAddress,
    );
  }
}
