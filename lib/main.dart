import 'package:flutter/material.dart';
import 'package:agromax/app.dart';
import 'package:agromax/controllers/dashboard_tab_notifier.dart';
import 'package:agromax/controllers/field_navigation_notifier.dart';

void main() {
  runApp(
    DashboardTabNotifier(
      child: FieldNavigationNotifier(
        child: const AgroMaxApp(),
      ),
    ),
  );
}