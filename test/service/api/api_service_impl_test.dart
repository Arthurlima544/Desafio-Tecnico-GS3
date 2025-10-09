import 'package:flutter_test/flutter_test.dart';
import 'package:gs3_tecnologia/service/api/api_service_impl.dart';
import 'package:gs3_tecnologia/service/dtos/card_dto.dart';
import 'package:gs3_tecnologia/service/dtos/transaction_dto.dart';
import 'package:gs3_tecnologia/utils/result.dart';

void main() {
  test('Ensure all Transactions and cards to Succeed', () async {
    final ApiServiceImpl apiService = ApiServiceImpl();
    final Result<List<CardDTO>> cardsResult = await apiService.fetchCards();
    final List<String> cardUuids = <String>[];

    expect(cardsResult, isA<Ok<List<CardDTO>>>());

    (cardsResult as Ok<List<CardDTO>>).value.map(
      (CardDTO c) => cardUuids.add(c.uuid),
    );

    for (final String cardUuid in cardUuids) {
      final Result<List<TransactionDTO>> transactionsResult = await apiService
          .fetchTransactionsByCardUuid(cardUuid);

      expect(transactionsResult, isA<Ok<List<TransactionDTO>>>());
    }
  });
}
