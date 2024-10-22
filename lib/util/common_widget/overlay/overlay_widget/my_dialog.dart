import 'package:flutter/material.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/styles.dart';

class MyDialog extends StatelessWidget {
  const MyDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    required this.onDeny,
  });

  final String title;
  final String content;
  final void Function() onConfirm;
  final void Function() onDeny;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: '#2b2b2b'.toColor(),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.all(AppStyles.width(15)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppStyles.f15sb().copyWith(
                    color: '#DBA510'.toColor(),
                  ),
                ),
                const VerticalSpace(25),
                Text(
                  content,
                  style: AppStyles.f15m().copyWith(
                    color: Colors.white,
                  ),
                ),
                const VerticalSpace(25),
                SizedBox(
                  height: AppStyles.height(40),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 50,
                        child: InkWell(
                          onTap: () => onConfirm(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: '#2b2b2b'.toColor(),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: '#FF6B00'.toColor(),
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                S.of(context).confirm,
                                style: AppStyles.f16m()
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const HorizontalSpace(10),
                      Expanded(
                        flex: 50,
                        child: InkWell(
                          onTap: () => onDeny(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: '#DBA510'.toColor(),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: '#FF6B00'.toColor(),
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                S.of(context).cancel,
                                style: AppStyles.f16m()
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
