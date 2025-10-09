import 'package:flutter/material.dart';

import '../../utils/design/design.dart';
import 'widgets/credit_card_carousel.dart';
import 'widgets/favorite_carousel.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/home_bottom_nav_bar.dart';
import 'widgets/home_separator.dart';
import 'widgets/latest_transactions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _widgetSelection = <Widget>[
    const HomeBody(),
    Container(color: Colors.transparent),
    Container(color: Colors.transparent),
    Container(color: Colors.transparent),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        body: _widgetSelection.elementAt(_selectedIndex),
        bottomNavigationBar: HomeBottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    ],
  );
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: Theme.of(context).extension<AppSpacings>()!.medium),
        const CreditCardCarousel(),
        SizedBox(height: Theme.of(context).extension<AppSpacings>()!.medium),
        const HomeSeparator(),
        SizedBox(height: Theme.of(context).extension<AppSpacings>()!.large),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Theme.of(context).extension<AppSpacings>()!.medium,
          ),
          child: const FavoriteCarousel(),
        ),
        const HomeSeparator(),
        SizedBox(height: Theme.of(context).extension<AppSpacings>()!.large),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Theme.of(context).extension<AppSpacings>()!.medium,
          ),
          child: LatestTransactions(),
        ),
      ],
    ),
  );
}
