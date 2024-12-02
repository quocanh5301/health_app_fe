import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/register/bloc/register_cubit.dart';
import 'package:health_app_flutter/feature/register/bloc/register_state.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/styles.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key, required this.formKey});

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
            context.read<RegisterCubit>().register();
          }
        },
        child: BlocBuilder<RegisterCubit, RegisterState>(
          buildWhen: (previous, current) =>
              previous.registerStatus != current.registerStatus,
          builder: (context, state) {
            return Stack(
              alignment: Alignment.centerLeft,
              children: [
                state.registerStatus == RegisterStatus.loading
                    ? const CupertinoActivityIndicator(color: Colors.white)
                    : const SizedBox(),
                Center(
                  child: Text(
                    S.of(context).register,
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
