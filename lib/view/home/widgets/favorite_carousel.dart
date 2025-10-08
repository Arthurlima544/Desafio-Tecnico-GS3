import 'package:flutter/material.dart';

import '../../../utils/design/design.dart';

class FavoriteCarousel extends StatelessWidget {
  const FavoriteCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> favorites = <Map<String, dynamic>>[
      <String, dynamic>{
        'icon': Icons.credit_card,
        'label': 'Cartão virtual',
        'onTap': () {},
      },
      <String, dynamic>{
        'icon': Icons.add_card,
        'label': 'Cartão adicional',
        'onTap': () {},
      },
      <String, dynamic>{
        'icon': Icons.shield_outlined,
        'label': 'Seguros',
        'onTap': () {},
      },
      <String, dynamic>{
        'icon': Icons.card_giftcard,
        'label': 'Pacotes',
        'onTap': () {},
      },
    ];
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('Meus favoritos', style: AppTextStyles.mulishBold14),
            Row(
              children: <Widget>[
                Text('Personalizar', style: AppTextStyles.mulishBold8),
                const SizedBox(width: 4),
                const Icon(
                  Icons.widgets_outlined,
                  color: AppColors.accentBlue,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: Theme.of(context).extension<AppSpacings>()!.large),
        Container(
          height: 120,
          decoration: const BoxDecoration(),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: favorites.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Theme.of(context).extension<AppSpacings>()!.medium,
              ),
              child: FavoriteItem(
                icon: favorites[index]['icon'] as IconData,
                label: favorites[index]['label'] as String,
                onTap: favorites[index]['onTap'] as VoidCallback?,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    required this.icon,
    required this.label,
    super.key,
    this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    child: Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(
            Theme.of(context).extension<AppSpacings>()!.medium,
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: AppColors.lightGrayWith20,
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          child: Icon(icon, color: AppColors.primaryVariant, size: 28),
        ),
        SizedBox(height: Theme.of(context).extension<AppSpacings>()!.small),
        Text(
          label,
          style: AppTextStyles.mulishRegular10.copyWith(
            color: AppColors.titleCarousel,
          ),
        ),
      ],
    ),
  );
}
