import 'package:flutter/material.dart';

import '../../../utils/design/design.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });
  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(color: AppColors.shadow, blurRadius: 10, spreadRadius: 5),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: Theme.of(context).extension<AppSpacings>()!.small,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _BottomNavItem(
                icon: AppIcons.home,
                label: 'Home',
                isSelected: selectedIndex == 0,
                onTap: () => onItemTapped(0),
              ),
              _BottomNavItem(
                icon: AppIcons.receipt,
                label: 'Fatura',
                isSelected: selectedIndex == 1,
                onTap: () => onItemTapped(1),
              ),
              _BottomNavItem(
                icon: AppIcons.bankCard,
                label: 'Cartão',
                isSelected: selectedIndex == 2,
                onTap: () => onItemTapped(2),
              ),
              _BottomNavItem(
                icon: AppIcons.shop,
                label: 'Shop',
                isSelected: selectedIndex == 3,
                onTap: () => onItemTapped(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Color? color = isSelected ? Colors.blue.shade600 : Colors.grey[600];

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: EdgeInsets.all(
          Theme.of(context).extension<AppSpacings>()!.small,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 4),
            Text(
              label,
              style: isSelected
                  ? AppTextStyles.mulishBold9.copyWith(
                      color: AppColors.accentBlue,
                    )
                  : AppTextStyles.mulishBold9,
            ),
          ],
        ),
      ),
    );
  }
}
