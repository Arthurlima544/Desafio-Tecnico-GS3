import '../../utils/result.dart';
import '../dtos/card_dto.dart';
import '../dtos/transaction_dto.dart';

abstract class ApiService {
  Future<Result<List<CardDTO>>> fetchCards();
  Future<Result<List<TransactionDTO>>> fetchTransactionsByCardUuid(
    String cardUuid,
  );
}
