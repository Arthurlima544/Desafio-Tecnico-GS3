import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../domain/repository/card/card_repository.dart';
import '../domain/repository/card/card_repository_impl.dart';
import '../domain/repository/transaction/transaction_repository.dart';
import '../domain/repository/transaction/transaction_repository_impl.dart';
import '../service/api/api_service.dart';
import '../service/api/api_service_impl.dart';
import '../view_model/home/home_view_model.dart';
import '../view_model/login/login_view_model.dart';

List<SingleChildWidget> get providers => <SingleChildWidget>[
  Provider<ApiService>(
    lazy: true,
    create: (BuildContext context) => ApiServiceImpl() as ApiService,
  ),
  Provider<CardRepository>(
    create: (BuildContext context) =>
        CardRepositoryImpl(apiService: context.read<ApiService>())
            as CardRepository,
  ),
  Provider<TransactionRepository>(
    create: (BuildContext context) =>
        TransactionRepositoryImpl(apiService: context.read<ApiService>())
            as TransactionRepository,
  ),

  ChangeNotifierProvider<HomeViewModel>(
    lazy: true,
    create: (BuildContext context) => HomeViewModel(
      cardRepository: context.read<CardRepository>(),
      transactionRepository: context.read<TransactionRepository>(),
    ),
  ),

  ChangeNotifierProvider<LoginViewModel>(
    create: (BuildContext context) => LoginViewModel(),
  ),
];
