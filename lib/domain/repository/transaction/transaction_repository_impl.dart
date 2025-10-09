import '../../../service/api/api_service.dart';
import '../../../service/dtos/transaction_dto.dart';
import '../../../utils/design/design.dart';
import '../../../utils/functions.dart';
import '../../../utils/result.dart';
import '../../entities/transaction_entity.dart';
import 'transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  TransactionRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  final ApiService _apiService;

  Map<String, List<TransactionEntity>>? _storedTransactions;
  @override
  Future<Result<List<TransactionEntity>>> fetchTransactionsByCardUuid(
    String cardUuid,
  ) async {
    if (_storedTransactions != null) {
      if (_storedTransactions!.containsKey(cardUuid)) {
        return Result<List<TransactionEntity>>.ok(
          _storedTransactions![cardUuid]!,
        );
      }
    }

    final Result<List<TransactionDTO>> res = await _apiService
        .fetchTransactionsByCardUuid(cardUuid);

    switch (res) {
      case Ok<List<TransactionDTO>>(:final List<TransactionDTO> value):
        final List<TransactionEntity> transactionEntityList = value
            .map(
              (TransactionDTO transactionDto) => TransactionEntity(
                uuid: transactionDto.uuid,
                name: transactionDto.name,
                icon: AppIcons.getIconByCodePoint(
                  int.parse(transactionDto.icon),
                ),
                dateTime: transactionDto.dateTime,
                amount: transactionDto.amount,
                installments: transactionDto.installments,
                hasAlert: transactionDto.hasAlert,
                dateGroup: formatSpecialDate(transactionDto.dateTime),
              ),
            )
            .toList();
        _storedTransactions ??= <String, List<TransactionEntity>>{};
        _storedTransactions![cardUuid] = transactionEntityList;
        return Result<List<TransactionEntity>>.ok(transactionEntityList);
      case Error<List<TransactionDTO>>(:final Exception error):
        return Result<List<TransactionEntity>>.error(error);
    }
  }
}
