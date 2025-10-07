import 'package:flutter/material.dart';

import '../../utils/design/design.dart';
import 'bottom_nav_item.dart';

class LoginBottomNav extends StatelessWidget {
  const LoginBottomNav({super.key});

  static final List<({IconData icon, String label})> _navItems =
      <({IconData icon, String label})>[
        (icon: Icons.credit_card_outlined, label: 'Solicitar\ncartão'),
        (icon: Icons.search, label: 'Acompanhar\nsolicitação'),
        (icon: Icons.help_outline, label: 'Perguntas\nfrequentes'),
        (icon: Icons.support_agent_outlined, label: 'Central de\natendimento'),
        (icon: Icons.chat_bubble_outline, label: 'Fale com\nnós'),
      ];

  @override
  Widget build(BuildContext context) {
    final double spacing = Theme.of(context).extension<AppSpacings>()!.large;

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: <Color>[
              Colors.black.withValues(alpha: .8),
              Colors.black.withValues(alpha: 0.0),
            ],
          ),
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: spacing),
          itemCount: _navItems.length,
          itemBuilder: (BuildContext context, int index) {
            final ({IconData icon, String label}) item = _navItems[index];
            return BottomNavItem(icon: item.icon, label: item.label);
          },
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(width: spacing),
        ),
      ),
    );
  }
}
