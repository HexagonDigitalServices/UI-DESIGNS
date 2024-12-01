import 'package:flutter/material.dart';

class CurvedNavBar extends StatefulWidget {
  const CurvedNavBar({super.key});

  @override
  _CurvedNavBarState createState() => _CurvedNavBarState();
}

class _CurvedNavBarState extends State<CurvedNavBar> {
  int _selectedIndex = 0;

  // Define data for tabs
  final List<_NavItem> _navItems = [
    _NavItem(icon: Icons.home_outlined, label: "Home", color: Colors.blue[200]!),
    _NavItem(icon: Icons.search, label: "Search", color: Colors.pink[200]!),
    _NavItem(icon: Icons.explore_outlined, label: "Explore", color: Colors.green[200]!),
    _NavItem(icon: Icons.message_outlined, label: "Message", color: Colors.orange[200]!),
    _NavItem(icon: Icons.person_outline_outlined, label: "Profile", color: Colors.red[200]!),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _navItems[_selectedIndex].color,
      body: Center(
        child: Text(
          "Selected: ${_navItems[_selectedIndex].label}",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          // Curved background
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(_navItems.length, (index) {
                return _selectedIndex == index
                    ? const SizedBox(width: 70) // Leave space for floating icon
                    : _buildNavItem(index, isActive: false);
              }),
            ),
          ),
          // Floating active icon
          Positioned(
            left: (_selectedIndex * MediaQuery.of(context).size.width / _navItems.length) +
                MediaQuery.of(context).size.width / (_navItems.length * 2) -
                35,
            bottom: 30,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.4),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Icon(
                _navItems[_selectedIndex].icon,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build nav items (active/inactive states handled dynamically)
  Widget _buildNavItem(int index, {required bool isActive}) {
    final navItem = _navItems[index];
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            navItem.icon,
            color: isActive ? Colors.white : Colors.white.withOpacity(0.7),
            size: isActive ? 35 : 28,
          ),
          const SizedBox(height: 5),
          Text(
            navItem.label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.white : Colors.white.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  final Color color;

  const _NavItem({required this.icon, required this.label, required this.color});
}
