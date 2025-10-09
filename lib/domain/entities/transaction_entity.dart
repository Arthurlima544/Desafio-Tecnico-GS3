import 'package:flutter/material.dart';

final class TransactionEntity {
  const TransactionEntity({
    required this.uuid,
    required this.name,
    required this.icon,
    required this.dateTime,
    required this.amount,
    required this.installments,
    required this.dateGroup,
    required this.hasAlert,
  });

  final String uuid;
  final String name;
  final IconData icon;
  final DateTime dateTime;
  final String amount;
  final String? installments;
  final String dateGroup;
  final bool hasAlert;
}
