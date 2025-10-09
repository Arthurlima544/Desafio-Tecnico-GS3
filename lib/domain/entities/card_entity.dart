final class CardEntity {
  const CardEntity({
    required this.uuid,
    required this.cardNumber,
    required this.cardHolder,
    required this.limit,
    required this.bestDay,
  });

  final String uuid;
  final String cardNumber;
  final String cardHolder;
  final double limit;
  final int bestDay;
}
