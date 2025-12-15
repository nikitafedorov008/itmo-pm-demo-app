import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:agromax/app.dart';
import 'package:agromax/l10n/app_localizations.dart' as l10n;
import 'package:agromax/controllers/dashboard_tab_notifier.dart';
import 'package:agromax/controllers/field_navigation_notifier.dart';
import 'package:agromax/providers/pest_disease_notifier.dart';

void main() {
  runApp(
    DashboardTabNotifier(
      child: FieldNavigationNotifier(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => PestDiseaseNotifier()),
          ],
          child: const AgroMaxApp(),
        ),
      ),
    ),
  );
}