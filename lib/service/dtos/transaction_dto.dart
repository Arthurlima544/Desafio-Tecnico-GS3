final class TransactionDTO {
  const TransactionDTO({
    required this.uuid,
    required this.name,
    required this.icon,
    required this.dateTime,
    required this.amount,
    required this.installments,
    required this.dateGroup,
    required this.hasAlert,
  });

  factory TransactionDTO.fromJson(Map<String, dynamic> json) => TransactionDTO(
    uuid: json['uuid'],
    name: json['name'],
    icon: int.parse(json['icon']),
    dateTime: DateTime.parse(json['dateTime']),
    amount: json['amount'],
    installments: json['installments'],
    dateGroup: json['dateGroup'],
    hasAlert: json['hasAlert'],
  );

  final String uuid;
  final String name;
  final int icon;
  final DateTime dateTime;
  final String amount;
  final String? installments;
  final String dateGroup;
  final bool hasAlert;
}
