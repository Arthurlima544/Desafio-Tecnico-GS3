import 'package:flutter/material.dart';

import '../../utils/design/design.dart';
import '../widgets/login_bottom_nav.dart';
import 'widgets/show_login_animated_modal.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login_page.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: AppColors.loginBackgroundGradient,
          ),
        ),
        Positioned(
          child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/logo.png', width: 242, height: 157),
                  const Text(
                    'Great Services, Smart Solutions',
                    style: AppTextStyles.manropeRegular16,
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          child: InkWell(
            onTap: () {
              showLoginAnimatedModal(context);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white70, width: 2),
                    color: Colors.transparent,
                  ),
                  child: const Icon(
                    AppIcons.add,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 15),
                const Text('Entrar', style: AppTextStyles.manropeBold14),
              ],
            ),
          ),
        ),
        const LoginBottomNav(),
      ],
    ),
  );
}
