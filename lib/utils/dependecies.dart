import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../view_model/login/login_view_model.dart';

List<SingleChildWidget> get providers => <SingleChildWidget>[
  ChangeNotifierProvider<LoginViewModel>(
    create: (BuildContext context) => LoginViewModel(),
  ),
];
