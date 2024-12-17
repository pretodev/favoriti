import 'package:flutter/material.dart';

import 'configs/application.dart';
import 'ui/screens/home/widgets/home_screen.dart';
import 'ui/styles/styles.dart';

void main() async {
  buildApp(
    tasks: [],
    builder: () => const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bemol App',
      theme: Styles.theme,
      home: HomeScreen(),
    );
  }
}
