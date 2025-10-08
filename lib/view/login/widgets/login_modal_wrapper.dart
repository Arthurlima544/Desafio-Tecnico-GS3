import 'package:flutter/material.dart';

import '../../../utils/design/design.dart';
import 'login_modal.dart';

/// A wrapper widget to handle keyboard insets.
class LoginModalWrapper extends StatefulWidget {
  const LoginModalWrapper({required this.onClose, super.key});

  final VoidCallback onClose;

  @override
  State<LoginModalWrapper> createState() => _LoginModalWrapperState();
}

class _LoginModalWrapperState extends State<LoginModalWrapper> {
  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              Theme.of(context).extension<AppSpacings>()!.large,
            ),
          ),
        ),
        child: LoginModal(onClose: widget.onClose),
      ),
    ),
  );
}
