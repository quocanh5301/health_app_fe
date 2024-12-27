import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:health_app_flutter/feature/register/bloc/register_cubit.dart';
import 'package:health_app_flutter/feature/register/bloc/register_state.dart';
import 'package:health_app_flutter/feature/register/ui/widget/go_to_login_button.dart';
import 'package:health_app_flutter/feature/register/ui/widget/register_button.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/images.dart';
import 'package:health_app_flutter/util/injection.dart';
import 'package:health_app_flutter/util/styles.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<RegisterCubit>(
        create: (context) => sl<RegisterCubit>(),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listenWhen: (previous, current) =>
              previous.registerStatus != current.registerStatus,
          listener: (context, state) {
            switch (state.registerStatus) {
              case RegisterStatus.initial:
                break;
              case RegisterStatus.loading:
                break;
              case RegisterStatus.success:
                context.pop(true);
              case RegisterStatus.failure:
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
                        AppImage.imgRandom1,
                        height: AppStyles.screenH,
                        fit: BoxFit.fill,
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
                          Text(
                            S.of(context).registerTitle1,
                            textAlign: TextAlign.center,
                            style: AppStyles.f16sb().copyWith(
                                color: '#FF6B00'.toColor(),
                                fontSize: AppStyles.fontSize(24),
                                fontWeight: FontWeight.w700),
                          ),
                          const VerticalSpace(10),
                          Text(
                            S.of(context).registerTitle2,
                            textAlign: TextAlign.center,
                            style: AppStyles.f14sb().copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const VerticalSpace(30),
                          FormBuilderTextField(
                            name: 'firstNameField',
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: S.of(context).name,
                              hintText: S.of(context).nameHint,
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
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(
                                  errorText: S.of(context).nameError,
                                ),
                              ],
                            ),
                            onTapOutside: (event) =>
                                FocusManager.instance.primaryFocus?.unfocus(),
                            onChanged: (firstName) => context
                                .read<RegisterCubit>()
                                .setName(firstName ?? ''),
                          ),
                          const VerticalSpace(20),
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
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: S.of(context).emailEmpty,
                              ),
                              FormBuilderValidators.email(
                                errorText: S.of(context).emailFormatError,
                              )
                            ]),
                            onChanged: (email) => context
                                .read<RegisterCubit>()
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
                                .read<RegisterCubit>()
                                .setPassword(password ?? ''),
                          ),
                          const VerticalSpace(32),
                          if (state.errorMessage.isNotEmpty &&
                              state.registerStatus ==
                                  RegisterStatus.failure) ...[
                            Text(
                              "state.errorMessage",
                              textAlign: TextAlign.center,
                              style: AppStyles.f16m().copyWith(
                                color: Colors.red,
                              ),
                            ),
                            const VerticalSpace(8)
                          ],
                          RegisterButton(formKey: _formKey),
                          const VerticalSpace(20),
                          const GoToLoginButton(),
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
