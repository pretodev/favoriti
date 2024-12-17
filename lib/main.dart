import 'package:flutter/material.dart';

import 'configs/application.dart';
import 'configs/firebase/firebase_boot.dart';
import 'ui/screens/home/widgets/home_screen.dart';
import 'ui/styles/styles.dart';

void main() async {
  buildApp(
    tasks: [
      FirebaseBoot(),
    ],
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
