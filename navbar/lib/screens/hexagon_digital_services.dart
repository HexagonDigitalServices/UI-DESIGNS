import 'package:flutter/material.dart';
import 'curved_nav_bar.dart';

class HexagonDigitalServices extends StatelessWidget {
  const HexagonDigitalServices({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurvedNavBar(),
    );
  }
}
