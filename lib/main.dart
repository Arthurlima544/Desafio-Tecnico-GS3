import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'my_app.dart';
import 'utils/dependecies.dart';

void main() {
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}
