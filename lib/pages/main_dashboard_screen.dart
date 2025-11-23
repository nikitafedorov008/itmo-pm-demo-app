import 'package:agromax/pages/field_details_screen.dart';
import 'package:agromax/pages/home_screen.dart';
import 'package:agromax/pages/plant_health_screen.dart';
import 'package:agromax/pages/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({super.key});

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const WeatherScreen(),
    const PlantHealthScreen(),
    const FieldDetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('AgroMax'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          color: Colors.white.withAlpha(200),
          borderRadius: BorderRadius.circular(
            34,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(12),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Home button
              _buildCustomNavItem(
                icon: Icons.home_outlined,
                activeIcon: Icons.home,
                index: 0,
              ),

              // Weather button
              _buildCustomNavItem(
                icon: Icons.cloud_outlined,
                activeIcon: Icons.cloud,
                index: 1,
              ),

              // Center FAB button - empty space for the FAB
              // Plant button
              // _buildCustomNavItem(
              //   icon: Icons.add_circle_outline,
              //   activeIcon: Icons.add_circle,
              //   index: 2,
              // ),

              // Plant button
              _buildCustomNavItem(
                icon: Icons.eco_outlined,
                activeIcon: Icons.eco,
                index: 2,
              ),

              // Field button
              _buildCustomNavItem(
                icon: Icons.map_outlined,
                activeIcon: Icons.map,
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomNavItem({
    required IconData icon,
    required IconData activeIcon,
    required int index,
  }) {
    final isActive = _currentIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.white.withAlpha(248) : Colors.transparent,
          borderRadius: BorderRadius.circular(48),
          boxShadow: isActive
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive ? const Color(0xFF2ECC71) : const Color(0xFF95A5A6),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              _getLabelForIndex(index),
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                color: isActive ? const Color(0xFF2ECC71) : const Color(0xFF95A5A6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0: return 'Home';
      case 1: return 'Weather';
      case 2: return 'Plant';
      case 3: return 'Field';
      default: return 'Home';
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomNavigationBarItem _buildBottomNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          size: 24,
          color: _currentIndex == index
              ? const Color(0xFF2ECC71)
              : const Color(0xFF95A5A6),
        ),
      ),
      activeIcon: Container(
        padding: const EdgeInsets.all(8),
        child: Icon(
          activeIcon,
          size: 24,
          color: const Color(0xFF2ECC71),
        ),
      ),
      label: label,
    );
  }
}