import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:health_app_flutter/feature/login/bloc/login_cubit.dart';
import 'package:health_app_flutter/feature/login/bloc/login_state.dart';
import 'package:health_app_flutter/feature/login/ui/widget/go_to_register_button.dart';
import 'package:health_app_flutter/feature/login/ui/widget/login_button.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/images.dart';
import 'package:health_app_flutter/util/injection.dart';
import 'package:health_app_flutter/util/router.dart';
import 'package:health_app_flutter/util/styles.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: BlocProvider<LoginCubit>(
        create: (context) => sl<LoginCubit>(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listenWhen: (previous, current) =>
              previous.loginStatus != current.loginStatus,
          listener: (context, state) {
            switch (state.loginStatus) {
              case LoginStatus.initial:
                break;
              case LoginStatus.loading:
                break;
              case LoginStatus.success:
                const BaseRoute().go(context);
              case LoginStatus.failure:
                break;
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.transparent],
                      ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height * 2),
                      );
                    },
                    blendMode: BlendMode.hardLight,
                    child: SizedBox(
                      width: AppStyles.screenW,
                      height: AppStyles.screenH,
                      child: Image.asset(
                        AppImage.imgRandom2,
                        height: AppStyles.screenH,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: AppStyles.screenW,
                    height: AppStyles.screenH,
                    padding: EdgeInsets.only(
                      top: MediaQuery.paddingOf(context).top,
                      left: AppStyles.width(36),
                      right: AppStyles.width(36),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const VerticalSpace(55),
                          Image.asset(
                            AppImage.imgIcon,
                            width: AppStyles.width(217),
                            height: AppStyles.height(86),
                            // color: '#FF6B00'.toColor(),
                          ),
                          const VerticalSpace(55),
                          Text(
                            S.of(context).intro,
                            textAlign: TextAlign.center,
                            style: AppStyles.f16m().copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const VerticalSpace(30),
                          FormBuilderTextField(
                            name: 'emailField',
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: S.of(context).email,
                              hintText: S.of(context).emailHint,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: '#FF6B00'.toColor(),
                                ),
                              ),
                              labelStyle: AppStyles.f14m().copyWith(
                                color: '#FF6B00'.toColor(),
                              ),
                              hintStyle: AppStyles.f14m().copyWith(
                                color: Colors.white,
                              ),
                            ),
                            style: AppStyles.f14m().copyWith(
                              color: '#FF6B00'.toColor(),
                            ),
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(
                                  errorText: S.of(context).emailEmpty,
                                ),
                                FormBuilderValidators.email(
                                  errorText: S.of(context).emailFormatError,
                                )
                              ],
                            ),
                            onChanged: (email) => context
                                .read<LoginCubit>()
                                .setEmail(email ?? ''),
                          ),
                          const VerticalSpace(20),
                          FormBuilderTextField(
                            name: 'passwordField',
                            decoration: InputDecoration(
                              labelText: S.of(context).password,
                              hintText: S.of(context).passwordHint,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: '#FF6B00'.toColor(),
                                ),
                              ),
                              labelStyle: AppStyles.f14m().copyWith(
                                color: '#FF6B00'.toColor(),
                              ),
                              hintStyle: AppStyles.f14m().copyWith(
                                color: Colors.white,
                              ),
                            ),
                            style: AppStyles.f14m().copyWith(
                              color: '#FF6B00'.toColor(),
                            ),
                            // obscureText: !state.isShowPassword,
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(
                                  errorText: S.of(context).passwordEmpty,
                                )
                              ],
                            ),
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            onChanged: (password) => context
                                .read<LoginCubit>()
                                .setPassword(password ?? ''),
                          ),
                          const VerticalSpace(24),
                          Row(
                            children: [
                              const Spacer(),
                              InkWell(
                                // onTap: () async {
                                //   final bool isForgot =
                                //       await const ForgetPassRoute().push(context);
                                //   if (isForgot ?? false) {
                                //     if (rootNavigatorKey.currentContext != null) {
                                //       showDialog(
                                //         context: rootNavigatorKey.currentContext!,
                                //         builder: (context) => AlertDialog(
                                //           title: Text(
                                //             S.of(context).forgotPasswordSuccess,
                                //           ),
                                //           titleTextStyle: AppStyles.f16m().copyWith(
                                //             color: '#0D0E0E'.toColor(),
                                //           ),
                                //           actions: [
                                //             TextButton(
                                //               onPressed: () => context.pop(),
                                //               child: Text(S.of(context).ok),
                                //             )
                                //           ],
                                //         ),
                                //       );
                                //     }
                                //   }
                                // },
                                child: Text(
                                  S.of(context).forgotPassword,
                                  style: AppStyles.f15m().copyWith(
                                    decoration: TextDecoration.underline,
                                    color: '#FF6B00'.toColor(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const VerticalSpace(32),
                          if (state.errorMessage.isNotEmpty &&
                              state.loginStatus == LoginStatus.failure) ...[
                            Text(
                              state.errorMessage,
                              textAlign: TextAlign.center,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  AppStyles.f16m().copyWith(color: Colors.red),
                            ),
                            const VerticalSpace(8)
                          ],
                          LoginButton(formKey: _formKey),
                          const VerticalSpace(20),
                          const GoToRegisterButton(),
                          const VerticalSpace(20)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
