import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/design/design.dart';
import '../../../view_model/home/home_view_model.dart';
import '../../widgets/shimmer.dart';
import '../../widgets/skeleton.dart';

class CreditCardCarousel extends StatelessWidget {
  const CreditCardCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = context.watch<HomeViewModel>();

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.22,
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (BuildContext context, Widget? child) => PageView(
          controller: PageController(viewportFraction: 0.9),
          onPageChanged: (int index) {
            viewModel.loadTransactionsCommand.execute(
              viewModel.cards[index].uuid,
            );
          },
          children: <Widget>[
            if (viewModel.cards.isNotEmpty)
              for (int i = 0; i < viewModel.cards.length; i++)
                CreditCardWidget(
                  cardNumber: viewModel.cards[i].cardNumber,
                  cardHolder: viewModel.cards[i].cardHolder,
                  availableLimit: null,
                  bestDay: viewModel.cards[i].bestDay.toString(),
                  gradient: AppColors.getLinearGradientForCard(i),
                )
            else
              const CreditCardWidget(
                cardNumber: null,
                cardHolder: null,
                availableLimit: null,
                bestDay: null,
                gradient: AppColors.card1Gradient,
              ),
          ],
        ),
      ),
    );
  }
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
  final String? cardNumber;
  final String? cardHolder;
  final String? availableLimit;
  final String? bestDay;
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
                    SizedBox(
                      height: 28,
                      width: 200,
                      child: cardNumber == null
                          ? const Shimmer(
                              child: Skeleton(
                                height: 14,
                                width: double.infinity,
                              ),
                            )
                          : Text(
                              cardNumber!,
                              style: AppTextStyles.mulishRegular14,
                            ),
                    ),
                    const SizedBox(height: 4),
                    if (cardHolder == null)
                      const Shimmer(child: Skeleton(height: 16, width: 100))
                    else
                      Text(cardHolder!, style: AppTextStyles.mulishRegular14),
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
                if (availableLimit == null)
                  const Shimmer(child: Skeleton(height: 24, width: 50))
                else
                  Text(
                    availableLimit!,
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
                if (bestDay == null)
                  const Shimmer(child: Skeleton(height: 24, width: 50))
                else
                  Text(bestDay!, style: AppTextStyles.mulishBold16LineHeight20),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
