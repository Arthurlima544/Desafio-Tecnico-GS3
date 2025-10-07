import 'package:flutter/material.dart';

import 'utils/design/design.dart';
import 'view/login/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'gs3_tecnologia',
    theme: lightTheme(),
    debugShowCheckedModeBanner: false,
    home: const Login(),
  );
}
