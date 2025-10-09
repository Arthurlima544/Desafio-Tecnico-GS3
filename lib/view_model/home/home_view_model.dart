import 'package:flutter/material.dart';

import '../../domain/entities/card_entity.dart';
import '../../domain/repository/card/card_repository.dart';
import '../../domain/repository/transaction/transaction_repository.dart';
import '../../utils/command.dart';
import '../../utils/result.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({
    required CardRepository cardRepository,
    required TransactionRepository transactionRepository,
  }) : _cardRepository = cardRepository,
       _transactionRepository = transactionRepository {
    loadHomePageCommand = Command0<void>(_loadHomePage)..execute();
  }

  List<CardEntity> cards = <CardEntity>[];

  String? loadCardsErrorMessage;

  final CardRepository _cardRepository;
  final TransactionRepository _transactionRepository;

  late final Command0<void> loadHomePageCommand;

  Future<Result<void>> _loadHomePage() async {
    final Result<List<CardEntity>> cardsResult = await _cardRepository
        .fetchCards();

    switch (cardsResult) {
      case Ok<List<CardEntity>>(:final List<CardEntity> value):
        cards = value;
        break;
      case Error<List<CardEntity>>():
        loadCardsErrorMessage = 'Erro desconhecido ao carregar os cartões';
        break;
    }

    notifyListeners();
    return cardsResult;
  }
}
