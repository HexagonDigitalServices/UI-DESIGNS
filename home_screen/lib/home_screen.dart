import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> serviceTiles = [
    'Beauty',
    'Cleaning',
    'Car Rental',
    'Delivery',
    'Zypp',
    'Washing',
    'Mart',
    'Restaurant',
    'Waiter',
    'Driver'
  ];

  final List<Map<String, String>> recommendations = [
    {
      'title': 'Discounts For Monday',
      'image': 'assets/monday.png',
      'description':
          'Enjoy amazing discount on all products this Monday only! Hurry, limited time offer!',
    },
    {
      'title': 'Midweek Special',
      'image': 'assets/special.png',
      'description':
          'Midweek just got better with exclusive offers! Check them out now!',
    },
    {
      'title': 'Weekend Deals',
      'image': 'assets/weekend.png',
      'description': 'Weekend deals you can’t resist! Shop now and save big!',
    },
    {
      'title': 'Festival Offers',
      'image': 'assets/festival.png',
      'description':
          'Celebrate the season with exciting festival discounts on selected items!',
    },
    {
      'title': 'Limited Time Sale',
      'image': 'assets/sale.png',
      'description':
          'Hurry up! Our limited-time sale is ending soon. Grab your favorites before they’re gone!',
    },
    {
      'title': 'Summer Discounts',
      'image': 'assets/summer.png',
      'description':
          'Get ready for summer with amazing discounts on all summer essentials!',
    },
    {
      'title': 'Buy 1 Get 1 Free',
      'image': 'assets/bogo.png',
      'description':
          'Buy 1 item and get another one absolutely free! Don’t miss out on this offer!',
    },
  ];

  int selectedCategoryIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeBanner(),
            _buildImageBanner('assets/banner.png'),
            _buildSectionTitle('Section Categories'),
            _buildServicesCategories(),
            _buildSectionTitle('Recommendations'),
            _buildHorizontalList(recommendations),
            _buildSectionTitle('Trending Services'),
            _buildGrid(serviceTiles),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF00AA08),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white),
        onPressed: () {},
      ),
      title: Row(
        children: [
          Icon(
            Icons.location_on,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(width: 5),
          Text(
            'Banglore, IN',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Icon(Icons.arrow_drop_down, color: Colors.white),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF00AA08),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
      ),
      child: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Done in No Time!',
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              speed: Duration(milliseconds: 200),
            ),
          ],
          isRepeatingAnimation: true,
        ),
      ),
    );
  }

  Widget _buildImageBanner(String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildServicesCategories() {
    final categories = [
      {'title': 'Food', 'icon': Icons.restaurant},
      {'title': 'Ride', 'icon': Icons.directions_car},
      {'title': 'Rent', 'icon': Icons.car_rental},
      {'title': 'Delivery', 'icon': Icons.local_shipping},
      {'title': 'Mart', 'icon': Icons.shopping_cart},
      {'title': 'Beauty', 'icon': Icons.face},
      {'title': 'Cleaning', 'icon': Icons.cleaning_services},
      {'title': 'More', 'icon': Icons.more_horiz},
    ];
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemCount: categories.length,
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedCategoryIndex = index;
            });
          },
          child: _buildCategoryItem(
            category['title'] as String,
            category['icon'] as IconData,
            selectedCategoryIndex == index,
          ),
        );
      },
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF00AA08) : Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: isSelected ? Color(0xFF00AA08) : Colors.grey,
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.white : Colors.black54,
            size: 30,
          ),
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: isSelected ? Color(0xFF00AA08) : Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget _buildHorizontalList(List<Map<String, String>> items) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return _buildRecommendationCard(
              title: item['title']!,
              imagePath: item['image']!,
              description: item['description']!,
            );
          }),
    );
  }

  Widget _buildRecommendationCard({
    required String title,
    required String imagePath,
    required String description,
  }) {
    return Container(
      width: 350,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFF00AA08),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid(List<String> items) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 3 / 4,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildGridItem(
            title: items[index],
            imagePath: 'assets/item${(index % 5) + 1}.png',
          );
        },
      ),
    );
  }

  Widget _buildGridItem({required String title, required String imagePath}) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 9),
        Text(
          title,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
  BottomNavigationBar _buildBottomNavigationBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
