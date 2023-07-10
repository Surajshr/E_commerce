import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:shopping_application/utils/common_utils.dart';

import '../../../../common/widgets/app_button.dart';
import '../../../home_page/view/dashboard_view.dart';
import '../../logic/auth_provider.dart';

class SubmitButton extends ConsumerWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(authViewModelProvider.notifier);
    final state = ref.watch(
      authViewModelProvider,
    );

    final isSignIn = state.formType == EmailPasswordSignInFormType.signIn;
    return state.isLoading
        ? Center(
            child: SizedBox(
              width: 48.r,
              height: 48.r,
              child: Padding(
                padding: EdgeInsets.all(4.r),
                child: const CircularProgressIndicator(),
              ),
            ),
          )
        : AppButton(
            borderSize: 100.r,
            height: 52.h,
            text: isSignIn ? 'Login' : 'Sign Up',
            onPressed: state.status.isPure || state.status.isInvalid
                ? null
                : () async {
                    String message = await ref
                        .read(authViewModelProvider.notifier)
                        .performLogin(context: context);
                    if (message.isNotEmpty) {
                      viewModel.showSnackBar(
                          context: context, message: message);
                    }
                    if (message == 'success') {
                      dPrint('insideSuccessView');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardView(),
                        ),
                      );
                    }
                  },
          );
  }
}
