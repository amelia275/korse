import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const KorseApp());
}

class KorseApp extends StatelessWidget {
  const KorseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Korse',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
