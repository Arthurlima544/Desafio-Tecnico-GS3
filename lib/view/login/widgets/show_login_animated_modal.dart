import 'package:flutter/material.dart';

import 'login_modal_wrapper.dart';

void showLoginAnimatedModal(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black45,
    transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder:
        (
          BuildContext buildContext,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) => LoginModalWrapper(onClose: () => Navigator.of(context).pop()),
    transitionBuilder:
        (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          final CurveTween curveTween = CurveTween(curve: Curves.easeOutBack);
          final Animation<double> curvedAnimation = curveTween.animate(
            animation,
          );

          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: child,
          );
        },
  );
}
