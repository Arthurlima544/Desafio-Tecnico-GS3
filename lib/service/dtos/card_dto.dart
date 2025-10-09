final class CardDTO {
  const CardDTO({
    required this.uuid,
    required this.cardNumber,
    required this.cardHolder,
    required this.limit,
    required this.bestDay,
    required this.expirationDate,
    required this.cvv,
  });

  factory CardDTO.fromJson(Map<String, dynamic> json) => CardDTO(
    uuid: json['uuid'],
    cardNumber: json['cardNumber'],
    cardHolder: json['cardHolder'],
    limit: json['limit'],
    bestDay: json['bestDay'],
    cvv: json['cvv'],
    expirationDate: json['expirationDate'],
  );

  final String uuid;
  final String cardNumber;
  final String cardHolder;
  final String expirationDate;
  final String cvv;
  final double limit;
  final int bestDay;
}
