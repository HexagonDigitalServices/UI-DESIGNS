import 'package:flutter/material.dart';
import 'package:ui_design/onboarding_screen.dart';

void main() {
  runApp(const HexagonDigitalServices());
}

class HexagonDigitalServices extends StatelessWidget {
  const HexagonDigitalServices({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home:  const OnboardingScreen(),
    );
  }
}
