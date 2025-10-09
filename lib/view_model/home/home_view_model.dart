import 'dart:async';
import 'package:flutter/material.dart';

import '../../domain/entities/card_entity.dart';
import '../../domain/entities/transaction_entity.dart';
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
    loadTransactionsCommand = Command1<void, String>(
      _loadTransactionsForCardOrderedByMostRecent,
    );
  }

  List<CardEntity> cards = <CardEntity>[];
  List<TransactionEntity> transactions = <TransactionEntity>[];
  Map<String, List<TransactionEntity>> get lastTransactionsGroupedByDay {
    final Map<String, List<TransactionEntity>> groupedTransactions =
        <String, List<TransactionEntity>>{};
    final List<TransactionEntity> lastTransactions = transactions.length > 3
        ? transactions.sublist(0, 3)
        : transactions;
    for (final TransactionEntity transaction in lastTransactions) {
      groupedTransactions
          .putIfAbsent(transaction.dateGroup, () => <TransactionEntity>[])
          .add(transaction);
    }

    return groupedTransactions;
  }

  String? loadCardsErrorMessage;
  String? loadTransactionsErrorMessage;

  final CardRepository _cardRepository;
  final TransactionRepository _transactionRepository;

  late final Command0<void> loadHomePageCommand;

  late final Command1<void, String> loadTransactionsCommand;
  Future<Result<void>> _loadHomePage() async {
    final Result<List<CardEntity>> cardsResult = await _cardRepository
        .fetchCards();

    switch (cardsResult) {
      case Ok<List<CardEntity>>(:final List<CardEntity> value):
        cards = value;
        notifyListeners();

        // When Starting the app, load transactions for the first card
        await _loadTransactionsForCardOrderedByMostRecent(cards[0].uuid);

        break;
      case Error<List<CardEntity>>():
        loadCardsErrorMessage = 'Erro desconhecido ao carregar os cartões';
        break;
    }

    notifyListeners();
    return cardsResult;
  }

  Future<Result<void>> _loadTransactionsForCardOrderedByMostRecent(
    String cardId,
  ) async {
    final Result<List<TransactionEntity>> transactionsResult =
        await _transactionRepository.fetchTransactionsByCardUuid(cardId);

    switch (transactionsResult) {
      case Ok<List<TransactionEntity>>(:final List<TransactionEntity> value):
        value.sort(
          (TransactionEntity a, TransactionEntity b) =>
              b.dateTime.compareTo(a.dateTime),
        );
        transactions = value;
        break;
      case Error<void>():
        loadTransactionsErrorMessage =
            'Erro desconhecido ao carregar as transações';
        break;
    }
    notifyListeners();
    return transactionsResult;
  }
}
