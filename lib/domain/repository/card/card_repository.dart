import '../../../utils/result.dart';
import '../../entities/card_entity.dart';

abstract class CardRepository {
  Future<Result<List<CardEntity>>> fetchCards();
}
