import '../../utils/result.dart';
import '../dtos/card_dto.dart';
import '../dtos/transaction_dto.dart';
import '../exceptions/api_exceptions.dart';
import 'api_service.dart';
import 'fake_data_responses.dart';

class ApiServiceImpl implements ApiService {
  @override
  Future<Result<List<CardDTO>>> fetchCards() async {
    //! Simulate an API call using fake delay and data
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return Result<List<CardDTO>>.ok(
      fakeFetchCardsResponse.map(CardDTO.fromJson).toList(),
    );
  }

  @override
  Future<Result<List<TransactionDTO>>> fetchTransactionsByCardUuid(
    String cardUuid,
  ) async {
    //! Simulate an API call using fake delay and data
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    final List<Map<String, Object>>? transactionsJson =
        fakeMapCardToTransactionsResponse[cardUuid];

    if (transactionsJson == null) {
      return Result<List<TransactionDTO>>.error(
        CardNotFoundException(stacktrace: StackTrace.current),
      );
    }

    return Result<List<TransactionDTO>>.ok(
      transactionsJson.map(TransactionDTO.fromJson).toList(),
    );
  }
}
