import 'package:flutter/material.dart';

import '../../../utils/design/design.dart';

class HomeSeparator extends StatelessWidget {
  const HomeSeparator({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(
      horizontal: Theme.of(context).extension<AppSpacings>()!.large,
    ),
    child: Container(height: 1, color: AppColors.outline),
  );
}
