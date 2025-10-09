import 'package:flutter/material.dart';

import '../../utils/design/app_colors.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) => Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: AppColors.skeleton,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
  );
}
