import 'package:flutter/material.dart';

import '../../utils/design/design.dart';
import 'widgets/credit_card_carousel.dart';
import 'widgets/favorite_carousel.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_bottom_nav_bar.dart';
import 'widgets/home_separator.dart';

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
        height: MediaQuery.sizeOf(context).height * 0.48,
        decoration: const BoxDecoration(
          gradient: AppColors.homeBackgroundGradient,
        ),
      ),
      Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: const HomeAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: Theme.of(context).extension<AppSpacings>()!.medium,
              ),
              const CreditCardCarousel(),
              SizedBox(
                height: Theme.of(context).extension<AppSpacings>()!.medium,
              ),
              const HomeSeparator(),
              SizedBox(
                height: Theme.of(context).extension<AppSpacings>()!.large,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Theme.of(
                    context,
                  ).extension<AppSpacings>()!.medium,
                ),
                child: const FavoriteCarousel(),
              ),
              const HomeSeparator(),
            ],
          ),
        ),
        bottomNavigationBar: HomeBottomNavBar(
          selectedIndex: 0,
          onItemTapped: (int idx) {},
        ),
      ),
    ],
  );
}
