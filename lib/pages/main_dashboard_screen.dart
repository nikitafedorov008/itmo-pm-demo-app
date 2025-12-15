import 'package:agromax/pages/agricultural_dashboard_screen.dart';
import 'package:agromax/pages/field_details_screen.dart';
import 'package:agromax/pages/home_screen.dart';
import 'package:agromax/pages/plant_health_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:agromax/l10n/app_localizations.dart' as l10n;

class MainDashboardScreen extends StatefulWidget {
  const MainDashboardScreen({super.key});

  @override
  State<MainDashboardScreen> createState() => _MainDashboardScreenState();
}

class _MainDashboardScreenState extends State<MainDashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const PlantHealthScreen(),
    const FieldDetailsScreen(),
    const AgriculturalDashboardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final s = l10n.AppLocalizations.of(context)!;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('AgroMax'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // Navigate to the Notifications screen using the route
              Navigator.pushNamed(context, '/notifications');
            },
          ),
          // IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: () {},
          // ),
        ],
        backgroundColor: Colors.transparent, // Keep app bar transparent over gradient
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE8F5E8), // Light green
              Color(0xFFE0F7FA), // Light blue/cyan
              Color(0xFFFFF8E1), // Light beige
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: _screens[_currentIndex],
      ),
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

              // Plant button
              _buildCustomNavItem(
                icon: Icons.eco_outlined,
                activeIcon: Icons.eco,
                index: 1,
              ),

              // Field button
              _buildCustomNavItem(
                icon: Icons.map_outlined,
                activeIcon: Icons.map,
                index: 2,
              ),

              // Agricultural tools button
              _buildCustomNavItem(
                icon: Icons.agriculture_outlined,
                activeIcon: Icons.agriculture,
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
      case 4: return 'Tools';
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