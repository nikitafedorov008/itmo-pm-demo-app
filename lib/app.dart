import 'package:agromax/pages/experiments_screen.dart';
import 'package:agromax/pages/field_details_screen.dart';
import 'package:agromax/pages/growth_screen.dart';
import 'package:agromax/pages/main_dashboard_screen.dart';
import 'package:agromax/pages/plant_health_screen.dart';
import 'package:agromax/pages/subscription_screen.dart';
import 'package:agromax/pages/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AgroMaxApp extends StatelessWidget {
  const AgroMaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroMax Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        textTheme: GoogleFonts.montserratTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Color(0xFF2ECC71),
          unselectedItemColor: Color(0xFF95A5A6),
          elevation: 10,
          showUnselectedLabels: true,
        ),
      ),
      home: const MainDashboardScreen(),
      routes: {
        '/weather': (context) => const WeatherScreen(),
        '/plant-health': (context) => const PlantHealthScreen(),
        '/field-details': (context) => const FieldDetailsScreen(),
        '/subscription': (context) => const SubscriptionScreen(),
        '/growth': (context) => const GrowthScreen(),
        '/experiments': (context) => const ExperimentsScreen(),
        '/dashboard': (context) => const MainDashboardScreen(),
      },
    );
  }
}