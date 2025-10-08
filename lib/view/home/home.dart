import 'package:flutter/material.dart';

import '../../utils/design/design.dart';
import 'widgets/home_app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => Stack(
    children: <Widget>[
      Container(color: AppColors.white),
      Container(
        height: MediaQuery.sizeOf(context).height * 0.45,
        decoration: const BoxDecoration(
          gradient: AppColors.homeBackgroundGradient,
        ),
      ),
      const Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: HomeAppBar(),
        body: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start),
        ),
      ),
    ],
  );
}
