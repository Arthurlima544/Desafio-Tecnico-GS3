import '../../../service/api/api_service.dart';
import '../../../service/dtos/card_dto.dart';
import '../../../utils/result.dart';
import '../../entities/card_entity.dart';
import 'card_repository.dart';

class CardRepositoryImpl implements CardRepository {
  CardRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;

  final ApiService _apiService;

  List<CardEntity>? _storedCards;

  @override
  Future<Result<List<CardEntity>>> fetchCards() async {
    if (_storedCards != null) {
      return Result<List<CardEntity>>.ok(_storedCards!);
    }

    final Result<List<CardDTO>> res = await _apiService.fetchCards();
    switch (res) {
      case Ok<List<CardDTO>>(:final List<CardDTO> value):
        final List<CardEntity> cardEntityList = value
            .map(
              (CardDTO cardDto) => CardEntity(
                uuid: cardDto.uuid,
                cardNumber: cardDto.cardNumber,
                cardHolder: cardDto.cardHolder,
                limit: cardDto.limit,
                bestDay: cardDto.bestDay,
              ),
            )
            .toList();
        _storedCards = cardEntityList;
        return Result<List<CardEntity>>.ok(cardEntityList);
      case Error<List<CardDTO>>(:final Exception error):
        return Result<List<CardEntity>>.error(error);
    }
  }
}
