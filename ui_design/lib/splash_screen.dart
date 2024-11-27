import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );

  late final Animation<Offset> _buttonAnimation = Tween<Offset>(
    begin: const Offset(0, 1),
    end: Offset.zero,
  ).animate(
    CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ),
  );
  bool _textVisible = false;
  bool _imageVisible = false;

  @override
  void initState() {
    super.initState();
    _scheduleAnimations();
  }

  void _scheduleAnimations() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => _textVisible = true);
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _imageVisible = true);
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildAnimatedContent({required Widget child, required bool visible}) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(seconds: 1),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(color: const Color(0xFF0D1125)), // Background
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Text
              _buildAnimatedContent(
                visible: _textVisible,
                child: const Padding(
                  padding: EdgeInsets.only(top: 80, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Carry',
                        style: TextStyle(
                          fontFamily: 'Cursive',
                          fontSize: 32,
                          color: Colors.yellow,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'BEST\nTO BUY',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 48,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Car Image
              _buildAnimatedContent(
                visible: _imageVisible,
                child: Center(
                  child: Image.asset(
                    'assets/car.png',
                    height: screenHeight * 0.5,
                    width: screenWidth * 1.5,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          // Get Started Button
          Positioned(
            bottom: 40,
            left: screenWidth * 0.1,
            right: screenWidth * 0.1,
            child: SlideTransition(
              position: _buttonAnimation,
              child: ElevatedButton(
                onPressed: () {
                  // Add action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'GET STARTED',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
