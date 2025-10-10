import 'package:flutter/material.dart';

class AppIcons {
  AppIcons._();

  static const IconData add = Icons.add;
  static const IconData arrowFoward = Icons.arrow_forward_ios;
  static const IconData bankCardAdd = Icons.credit_card;
  static const IconData bankCard = Icons.credit_card_outlined;
  static const IconData chatBubble = Icons.chat_bubble_outline;
  static const IconData exclamationMark = Icons.error;
  static const IconData fileText = Icons.description;
  static const IconData home = Icons.home;
  static const IconData mail = Icons.mail;
  static const IconData mobile = Icons.phone_android;
  static const IconData notification = Icons.notifications;
  static const IconData questionMark = Icons.help;
  static const IconData search = Icons.search;
  static const IconData shop = Icons.shop;
  static const IconData visibilityOutlined = Icons.visibility_outlined;
  static const IconData visibilityOffOutlined = Icons.visibility_off_outlined;
  static const IconData receipt = Icons.receipt_long_outlined;

  static const Map<int, IconData> _iconMap = <int, IconData>{
    0xe541: Icons.shopping_cart,
    0xe8cc: Icons.supervisor_account,
    0xef50: Icons.qr_code_scanner,
    0xe325: Icons.house,
    0xe531: Icons.receipt,
    0xe40f: Icons.monetization_on,
    0xe030: Icons.assessment,
    0xe546: Icons.store,
    0xea68: Icons.payments,
    0xe54e: Icons.sync,
    0xe8a1: Icons.person,
    0xe865: Icons.inventory,
  };

  static IconData getIconByCodePoint(int codePoint) =>
      _iconMap[codePoint] ?? Icons.help_outline;
}
