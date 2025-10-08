import 'package:flutter/material.dart';

import '../../../utils/design/design.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) => AppBar(
    backgroundColor: AppColors.transparent,
    elevation: 0,
    title: const Text.rich(
      TextSpan(
        text: 'Olá, ',
        style: AppTextStyles.mulishRegular17,
        children: <TextSpan>[
          TextSpan(text: 'Cliente', style: AppTextStyles.mulishSemiBold17),
        ],
      ),
    ),
    centerTitle: true,
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.chat_bubble_outline, color: AppColors.white),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(AppIcons.notification, color: AppColors.white),
        onPressed: () {},
      ),
    ],
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(5),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Theme.of(context).extension<AppSpacings>()!.large,
        ),
        child: Container(height: 1, color: AppColors.outline),
      ),
    ),
  );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
