final class TransactionDTO {
  const TransactionDTO({
    required this.uuid,
    required this.name,
    required this.icon,
    required this.dateTime,
    required this.amount,
    required this.installments,
    required this.hasAlert,
  });

  factory TransactionDTO.fromJson(Map<String, dynamic> json) => TransactionDTO(
    uuid: json['uuid'],
    name: json['name'],
    icon: json['icon'],
    dateTime: DateTime.parse(json['dateTime']),
    amount: json['amount'],
    installments: json['installments'],
    hasAlert: json['hasAlert'] == 1,
  );

  final String uuid;
  final String name;
  final String icon;
  final DateTime dateTime;
  final double amount;
  final int installments;
  final bool hasAlert;
}
