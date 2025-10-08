import 'package:flutter/material.dart';

import '../../../utils/design/design.dart';

class CreditCardCarousel extends StatelessWidget {
  const CreditCardCarousel({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: MediaQuery.sizeOf(context).height * 0.22,
    child: PageView(
      controller: PageController(viewportFraction: 0.9),
      children: const <Widget>[
        CreditCardWidget(
          cardNumber: '•••• 5621',
          cardHolder: 'GS3 TEC',
          availableLimit: 'R\$ 7.867,80',
          bestDay: '20',
          gradient: AppColors.card1Gradient,
        ),
        CreditCardWidget(
          cardNumber: '•••• 1234',
          cardHolder: 'Cliente',
          availableLimit: 'R\$ 5.000,00',
          bestDay: '10',
          gradient: AppColors.card2Gradient,
        ),
      ],
    ),
  );
}

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({
    required this.cardNumber,
    required this.cardHolder,
    required this.availableLimit,
    required this.bestDay,
    required this.gradient,
    super.key,
  });
  final String cardNumber;
  final String cardHolder;
  final String availableLimit;
  final String bestDay;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(
      horizontal: Theme.of(context).extension<AppSpacings>()!.small,
    ),
    padding: EdgeInsets.all(Theme.of(context).extension<AppSpacings>()!.medium),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: gradient,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: AppColors.shadow,
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 35,
                  decoration: BoxDecoration(
                    color: AppColors.chipColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                SizedBox(
                  width: Theme.of(context).extension<AppSpacings>()!.medium,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(cardNumber, style: AppTextStyles.mulishRegular14),
                    Text(cardHolder, style: AppTextStyles.mulishRegular14),
                  ],
                ),
              ],
            ),
            const Icon(
              AppIcons.visibilityOutlined,
              color: AppColors.iconAction,
            ),
          ],
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Limite disponível',
                  style: AppTextStyles.mulishRegular8,
                ),
                Text(
                  availableLimit,
                  style: AppTextStyles.mulishBold16LineHeight20,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const Text(
                  'Melhor dia de compra',
                  style: AppTextStyles.mulishRegular8,
                ),
                Text(bestDay, style: AppTextStyles.mulishBold16LineHeight20),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
