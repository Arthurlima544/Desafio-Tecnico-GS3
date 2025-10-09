import '../../../utils/result.dart';
import '../../entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Result<List<TransactionEntity>>> fetchTransactionsByCardUuid(
    String cardUuid,
  );
}
