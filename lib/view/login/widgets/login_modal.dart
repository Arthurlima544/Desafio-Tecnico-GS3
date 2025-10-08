import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/design/design.dart';
import '../../../view_model/login/login_view_model.dart';

class LoginModal extends StatefulWidget {
  const LoginModal({required this.onClose, super.key});

  final VoidCallback onClose;

  @override
  State<LoginModal> createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> {
  late final TextEditingController _cpfController;
  late final TextEditingController _passwordController;

  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _cpfController = TextEditingController();
    _passwordController = TextEditingController();

    final LoginViewModel viewModel = context.read<LoginViewModel>();

    _cpfController.addListener(() {
      viewModel.onCpfChanged(_cpfController.text);
    });

    _passwordController.addListener(() {
      viewModel
        ..onPasswordChanged(_passwordController.text)
        ..validateCredentials();
    });
  }

  @override
  void dispose() {
    _cpfController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(Theme.of(context).extension<AppSpacings>()!.large),
    child: ListenableBuilder(
      listenable: context.watch<LoginViewModel>(),
      builder: (BuildContext context, Widget? child) {
        final LoginViewModel loginViewModel = context.read<LoginViewModel>();
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Seja bem-vindo(a)!', style: AppTextStyles.mulishBold16),
            SizedBox(
              height: Theme.of(context).extension<AppSpacings>()!.medium,
            ),
            const Text(
              'Digite sua senha do aplicativo.',
              style: AppTextStyles.manropeRegular16LineHeight24,
            ),
            SizedBox(height: Theme.of(context).extension<AppSpacings>()!.large),
            TextFormField(
              controller: _cpfController,
              style: AppTextStyles.manropeRegular16LigthGray,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: loginViewModel.validateCpf,
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
            SizedBox(
              height: Theme.of(context).extension<AppSpacings>()!.medium,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              style: AppTextStyles.manropeRegular16LigthGray,
              textInputAction: TextInputAction.done,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: loginViewModel.validatePassword,
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
                onPressed: loginViewModel.isFormValid
                    ? () {
                        FocusScope.of(context).unfocus();
                        widget.onClose();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: EdgeInsets.symmetric(
                    vertical: Theme.of(
                      context,
                    ).extension<AppSpacings>()!.medium,
                  ),
                  disabledBackgroundColor: AppColors.lightWhite,

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
        );
      },
    ),
  );
}
