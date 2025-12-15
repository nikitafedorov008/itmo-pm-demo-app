import 'package:agromax/pages/agricultural_dashboard_screen.dart';
import 'package:agromax/pages/crop_rotation_screen.dart';
import 'package:agromax/pages/details_field_screen.dart';
import 'package:agromax/pages/experiments_screen.dart';
import 'package:agromax/pages/field_details_screen.dart';
import 'package:agromax/pages/fertilizer_calculator_screen.dart';
import 'package:agromax/pages/growth_screen.dart';
import 'package:agromax/pages/irrigation_scheduler_screen.dart';
import 'package:agromax/pages/login_screen.dart';
import 'package:agromax/pages/main_dashboard_screen.dart';
import 'package:agromax/pages/notifications_screen.dart';
import 'package:agromax/pages/pest_disease_screen.dart';
import 'package:agromax/pages/plant_health_screen.dart';
import 'package:agromax/pages/soil_analysis_screen.dart';
import 'package:agromax/pages/subscription_screen.dart';
import 'package:agromax/pages/weekly_insights_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AgroMaxApp extends StatelessWidget {
  const AgroMaxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroMax Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.transparent, // Changed to transparent for gradient
        textTheme: GoogleFonts.montserratTextTheme(),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: Colors.transparent, // Changed for transparency
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
      home: const LoginScreen(), // Set login screen as home
      builder: (context, child) => DecoratedBox(
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
        child: child,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/plant-health': (context) => const PlantHealthScreen(),
        '/field-details': (context) => const FieldDetailsScreen(),
        '/subscription': (context) => const SubscriptionScreen(),
        '/growth': (context) => const GrowthScreen(),
        '/experiments': (context) => const ExperimentsScreen(),
        '/dashboard': (context) => const MainDashboardScreen(),
        '/soil-analysis': (context) => const SoilAnalysisScreen(),
        '/pest-disease': (context) => const PestDiseaseScreen(),
        '/crop-rotation': (context) => const CropRotationScreen(),
        '/agricultural-dashboard': (context) => const AgriculturalDashboardScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/fertilizer-calculator': (context) => const FertilizerCalculatorScreen(),
        '/irrigation-scheduler': (context) => const IrrigationSchedulerScreen(),
        '/growth': (context) => const GrowthScreen(),
        '/experiments': (context) => const ExperimentsScreen(),
        '/weekly-insights': (context) => const WeeklyInsightsScreen(),
        '/details-field': (context) => const DetailsFieldScreen(),
      },
    );
  }
}