import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // List of pages for the onboarding screen
  final List<_OnboardingPage> _pages = const [
    _OnboardingPage(
      title: "Physical\nProducts",
      description:
      "We revolutionize the way merchants operate whether through one shopping cart or multiple marketplaces.",
      imagePath: "assets/Lock.png",
      gradientColors: [Colors.blueAccent, Colors.indigo],
    ),
    _OnboardingPage(
      title: "Time",
      description:
      "We transform service-based e-commerce allowing time sellers to focus on service delivery.",
      imagePath: "assets/time.png",
      gradientColors: [Colors.lightBlueAccent, Colors.lightBlue],
    ),
    _OnboardingPage(
      title: "Digital\nAssets",
      description:
      "We make it easier than ever to sell digital products like courses and files.",
      imagePath: "assets/digital_course.png",
      gradientColors: [Colors.purple, Colors.pinkAccent],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) => _pages[index].build(context),
          ),
          _buildNavigationButton(),
        ],
      ),
    );
  }

  // Navigation Button for "Next" or "Get Started"
  Positioned _buildNavigationButton() {
    return Positioned(
      bottom: 40,
      right: 20,
      child: ElevatedButton(
        onPressed: _navigate,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white.withOpacity(0.8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          elevation: 4,
          shadowColor: Colors.black.withOpacity(0.9),
        ),
        child: Text(
          _currentPage == _pages.length - 1 ? "Get Started" : "Next",
          style: TextStyle(
            color: _pages[_currentPage].gradientColors[1],
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Navigate to the next page or main screen
  void _navigate() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, "/main");
    }
  }
}

// Onboarding Page Widget
class _OnboardingPage {
  final String title;
  final String description;
  final String imagePath;
  final List<Color> gradientColors;

  const _OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.gradientColors,
  });

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Image.asset(
              imagePath,
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: 1,
                      fontFamily: "Sour Gummy",
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      height: 1.3,
                      fontFamily: "Sour Gummy",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
