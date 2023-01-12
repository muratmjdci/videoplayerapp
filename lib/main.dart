import 'package:flutter/material.dart';
import 'package:videoslideapp/locator.dart';

import 'ui/home/home_view.dart';

void main() {
  setUpDependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
    );
  }
}
