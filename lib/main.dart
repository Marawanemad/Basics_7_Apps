import 'package:basicapps/choosingApp.dart';
import 'package:flutter/material.dart';

import 'ShoppApp/Pages/Edit.dart';
import 'ShoppApp/Pages/Info.dart';
import 'ShoppApp/Pages/Products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChooseApp(),
      routes: {
        '/Products': (_) => const Products(),
        '/Info': (_) => const Info(),
        '/Edit': (_) => const Edit(),
      },
    );
  }
}
