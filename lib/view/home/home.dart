import 'package:flutter/material.dart';

import '../../utils/design/design.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_bottom_nav_bar.dart';

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
      Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: const HomeAppBar(),
        body: const SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start),
        ),
        bottomNavigationBar: HomeBottomNavBar(
          selectedIndex: 0,
          onItemTapped: (int idx) {},
        ),
      ),
    ],
  );
}
