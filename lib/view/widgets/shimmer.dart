import 'package:flutter/material.dart';

import '../../utils/design/app_colors.dart';

class Shimmer extends StatefulWidget {
  const Shimmer({
    required this.child,
    super.key,
    this.baseColor = AppColors.lightWhite,
    this.highlightColor = AppColors.white,
    this.duration = const Duration(milliseconds: 2000),
  });
  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  final Duration duration;

  @override
  State<Shimmer> createState() => _ShimmerState();
}

class _ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _controller,
    child: widget.child,
    builder: (BuildContext context, Widget? child) => ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) => LinearGradient(
        colors: <Color>[
          widget.baseColor,
          widget.highlightColor,
          widget.baseColor,
        ],
        stops: const <double>[0.2, 0.5, 0.8],
        transform: _SlidingGradientTransform(
          slidePercentage: _controller.value,
        ),
      ).createShader(bounds),
      child: child,
    ),
  );
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({required this.slidePercentage});

  final double slidePercentage;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    final double move = (slidePercentage * 2) - 1;
    return Matrix4.translationValues(bounds.width * move, 0.0, 0.0);
  }
}
