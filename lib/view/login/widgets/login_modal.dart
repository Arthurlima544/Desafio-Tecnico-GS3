import 'package:flutter/material.dart';

import '../../../utils/design/design.dart';

class LoginModal extends StatefulWidget {
  const LoginModal({required this.onClose, super.key});

  final VoidCallback onClose;

  @override
  State<LoginModal> createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(Theme.of(context).extension<AppSpacings>()!.large),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Seja bem-vindo(a)!', style: AppTextStyles.mulishBold16),
        SizedBox(height: Theme.of(context).extension<AppSpacings>()!.medium),
        const Text(
          'Digite sua senha do aplicativo.',
          style: AppTextStyles.manropeRegular16LineHeight24,
        ),
        SizedBox(height: Theme.of(context).extension<AppSpacings>()!.large),
        TextFormField(
          style: AppTextStyles.manropeRegular16LigthGray,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'CPF',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: AppColors.ligthergray),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: AppColors.primaryVariant),
            ),

            hintText: 'Digite seu CPF',
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: Theme.of(context).extension<AppSpacings>()!.medium),
        TextFormField(
          obscureText: !_isPasswordVisible,
          style: AppTextStyles.manropeRegular16LigthGray,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            labelText: 'Senha',
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: 'Digite sua senha',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: AppColors.primaryVariant),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: const BorderSide(color: AppColors.ligthergray),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible
                    ? AppIcons.visibilityOutlined
                    : AppIcons.visibilityOffOutlined,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
        ),
        SizedBox(height: Theme.of(context).extension<AppSpacings>()!.large),
        SizedBox(height: Theme.of(context).extension<AppSpacings>()!.small),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              widget.onClose();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(
                vertical: Theme.of(context).extension<AppSpacings>()!.medium,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            child: const Text(
              'Confirmar',
              style: AppTextStyles.mulishSemiBold16,
            ),
          ),
        ),
        SizedBox(height: Theme.of(context).extension<AppSpacings>()!.small),
      ],
    ),
  );
}
