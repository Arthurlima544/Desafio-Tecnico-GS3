import 'package:flutter/material.dart';

import '../../../utils/design/design.dart';
import 'home_separator.dart';

class LatestTransactions extends StatelessWidget {
  LatestTransactions({super.key});
  final List<Map<String, dynamic>> transactions = <Map<String, dynamic>>[
    <String, dynamic>{
      'date_group': 'Hoje, 05 Set',
      'icon': Icons.phone_iphone,
      'name': 'Apple',
      'time': '05/09 às 22:35',
      'amount': 'R\$545,99',
      'installments': 'em 12x',
      'has_alert': false,
    },
    <String, dynamic>{
      'icon': Icons.local_taxi_outlined,
      'name': 'Uber*Uber*Trip',
      'time': '05/09 às 15:25',
      'amount': 'R\$12,96',
      'installments': null,
      'has_alert': true,
    },
    <String, dynamic>{
      'date_group': '03 Set',
      'icon': Icons.shopping_cart_outlined,
      'name': 'Carrefour',
      'time': '03/09 às 09:34',
      'amount': 'R\$349,76',
      'installments': 'em 3x',
      'has_alert': false,
    },
  ];

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          const Text('Últimos lançamentos', style: AppTextStyles.mulishBold14),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Row(
              children: <Widget>[
                Text('Ver todos', style: AppTextStyles.mulishBold8),
                const Icon(
                  AppIcons.arrowFoward,
                  color: AppColors.accentBlue,
                  size: 20,
                ),
              ],
            ),
          ),
        ],
      ),
      ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          final Map<String, dynamic> transaction = transactions[index];
          final bool showDateHeader = transaction.containsKey('date_group');
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (showDateHeader)
                Padding(
                  padding: EdgeInsets.only(
                    top: Theme.of(context).extension<AppSpacings>()!.medium,
                    bottom: Theme.of(context).extension<AppSpacings>()!.small,
                  ),
                  child: Text(
                    transaction['date_group'],
                    style: AppTextStyles.mulishBold12.copyWith(
                      color: AppColors.accentBlue,
                    ),
                  ),
                ),
              TransactionItem(
                icon: transaction['icon'],
                name: transaction['name'],
                time: transaction['time'],
                amount: transaction['amount'],
                installments: transaction['installments'],
                hasAlert: transaction['has_alert'],
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const HomeSeparator(),
      ),
    ],
  );
}

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    required this.icon,
    required this.name,
    required this.time,
    required this.amount,
    super.key,
    this.installments,
    this.hasAlert = false,
  });
  final IconData icon;
  final String name;
  final String time;
  final String amount;
  final String? installments;
  final bool hasAlert;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(
      vertical: Theme.of(context).extension<AppSpacings>()!.small,
    ),
    child: Row(
      children: <Widget>[
        Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(
                Theme.of(context).extension<AppSpacings>()!.medium,
              ),
              decoration: BoxDecoration(
                color: AppColors.outlineWith20,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: AppColors.primaryVariant, size: 24),
            ),
            if (hasAlert)
              const Positioned(
                top: 0,
                right: 0,
                child: Icon(
                  AppIcons.exclamationMark,
                  color: AppColors.alert,
                  size: 16,
                ),
              ),
          ],
        ),

        SizedBox(width: Theme.of(context).extension<AppSpacings>()!.medium),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(name, style: AppTextStyles.mulishBold12),
                ],
              ),
              Text(time, style: AppTextStyles.mulishRegular10),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(amount, style: AppTextStyles.mulishBold12),
            if (installments != null)
              Text(
                installments!,
                style: AppTextStyles.mulishBold10.copyWith(
                  color: AppColors.ligthergray,
                ),
              ),
          ],
        ),
      ],
    ),
  );
}
