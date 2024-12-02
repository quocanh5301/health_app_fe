import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/router.dart';
import 'package:health_app_flutter/util/styles.dart';

class GoToRegisterButton extends StatelessWidget {
  const GoToRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: S.of(context).registerText1,
        style: AppStyles.f16sb().copyWith(color: Colors.white),
        children: <TextSpan>[
          TextSpan(
            text: S.of(context).registerText2,
            style: AppStyles.f16sb().copyWith(
              decoration: TextDecoration.underline,
              color: '#FF6B00'.toColor(),
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                final bool? isRegistered =
                    await const RegisterRoute().push(context);
                if (isRegistered ?? false) {
                  if (rootNavigatorKey.currentContext != null) {
                    showDialog(
                      context: rootNavigatorKey.currentContext!,
                      builder: (context) => AlertDialog(
                        title: Text(
                          S.of(context).registerSuccess,
                        ),
                        titleTextStyle: AppStyles.f16m().copyWith(
                          color: '#0D0E0E'.toColor(),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => context.pop(),
                            child: Text(S.of(context).ok),
                          )
                        ],
                      ),
                    );
                  }
                }
              },
          )
        ],
      ),
    );
  }
}
