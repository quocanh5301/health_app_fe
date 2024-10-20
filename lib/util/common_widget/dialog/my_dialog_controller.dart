import 'package:flutter/material.dart';
import 'package:health_app_flutter/util/common_widget/dialog/my_dialog.dart';
import 'package:health_app_flutter/util/router.dart';

class DialogWidgetController {
  BuildContext? get context => rootNavigatorKey.currentContext;

  OverlayEntry? _overlayEntry;

  void hideDialog() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void showDialog({
    required String title,
    required String content,
    required void Function() onConfirm,
    required void Function() onDeny,
  }) {
    if (context != null && _overlayEntry != null) {
      if (context != null) {
        _overlayEntry = OverlayEntry(
          builder: (_) {
            return MyDialog(
              title: title,
              content: content,
              onConfirm: onConfirm,
              onDeny: onDeny,
            );
          },
        );
        Overlay.of(context!).insert(_overlayEntry!);
      }
    }
  }
}
