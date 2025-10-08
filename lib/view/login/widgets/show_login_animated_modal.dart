import 'package:flutter/material.dart';

import '../../home/home.dart';
import 'login_modal_wrapper.dart';

Future<void> showLoginAnimatedModal(BuildContext context) async {
  final bool? loginSuccess = await showGeneralDialog<bool>(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    transitionDuration: const Duration(milliseconds: 1000),
    pageBuilder:
        (
          BuildContext buildContext,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) => LoginModalWrapper(
          onClose: (bool success) {
            Navigator.of(buildContext).pop(success);
          },
        ),
    transitionBuilder:
        (
          BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child,
        ) {
          final CurvedAnimation curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack,
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

  if (loginSuccess == true) {
    // Wait for the modal to fully close before navigating.
    await Future<dynamic>.delayed(const Duration(milliseconds: 1150));

    if (context.mounted) {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute<dynamic>(builder: (_) => const Home()),
      );
    }
  }
}
