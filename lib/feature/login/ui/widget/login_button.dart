import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/login/bloc/login_cubit.dart';
import 'package:health_app_flutter/feature/login/bloc/login_state.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/styles.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppStyles.screenW - AppStyles.width(72),
      height: AppStyles.height(48),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: '#FF6B00'.toColor(),
      ),
      child: TextButton(
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            context.read<LoginCubit>().login();
          }
        },
        child: BlocBuilder<LoginCubit, LoginState>(
          buildWhen: (previous, current) =>
              previous.loginStatus != current.loginStatus,
          builder: (context, state) {
            return Stack(
              alignment: Alignment.centerLeft,
              children: [
                state.loginStatus == LoginStatus.loading
                    ? const CupertinoActivityIndicator(color: Colors.white)
                    : const SizedBox(),
                Center(
                  child: Text(
                    S.of(context).login,
                    style: AppStyles.f16m().copyWith(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
