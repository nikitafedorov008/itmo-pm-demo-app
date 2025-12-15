import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'AgroMax'**
  String get appName;

  /// No description provided for @agriculturalManagementSystem.
  ///
  /// In en, this message translates to:
  /// **'Agricultural Management System'**
  String get agriculturalManagementSystem;

  /// No description provided for @welcomeToAgroMax.
  ///
  /// In en, this message translates to:
  /// **'Welcome to AgroMax'**
  String get welcomeToAgroMax;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @enterUsername.
  ///
  /// In en, this message translates to:
  /// **'Enter your username'**
  String get enterUsername;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get login;

  /// No description provided for @demoLogin.
  ///
  /// In en, this message translates to:
  /// **'Demo login'**
  String get demoLogin;

  /// No description provided for @demoCredentials.
  ///
  /// In en, this message translates to:
  /// **'demo / demo'**
  String get demoCredentials;

  /// No description provided for @invalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid username or password'**
  String get invalidCredentials;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @fieldStatus.
  ///
  /// In en, this message translates to:
  /// **'Field Status'**
  String get fieldStatus;

  /// No description provided for @quickAccess.
  ///
  /// In en, this message translates to:
  /// **'Quick Access'**
  String get quickAccess;

  /// No description provided for @recentActivities.
  ///
  /// In en, this message translates to:
  /// **'Recent Activities'**
  String get recentActivities;

  /// No description provided for @agriculturalTools.
  ///
  /// In en, this message translates to:
  /// **'Agricultural Tools'**
  String get agriculturalTools;

  /// No description provided for @soilAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Soil Analysis'**
  String get soilAnalysis;

  /// No description provided for @analyzeSoilComposition.
  ///
  /// In en, this message translates to:
  /// **'Analyze soil composition and nutrients'**
  String get analyzeSoilComposition;

  /// No description provided for @pestDisease.
  ///
  /// In en, this message translates to:
  /// **'Pest & Disease'**
  String get pestDisease;

  /// No description provided for @detectManageCropPests.
  ///
  /// In en, this message translates to:
  /// **'Detect and manage crop pests'**
  String get detectManageCropPests;

  /// No description provided for @cropRotation.
  ///
  /// In en, this message translates to:
  /// **'Crop Rotation'**
  String get cropRotation;

  /// No description provided for @planSustainableCropRotation.
  ///
  /// In en, this message translates to:
  /// **'Plan sustainable crop rotation'**
  String get planSustainableCropRotation;

  /// No description provided for @fertilizerCalculator.
  ///
  /// In en, this message translates to:
  /// **'Fertilizer Calculator'**
  String get fertilizerCalculator;

  /// No description provided for @calculateOptimalFertilizerAmounts.
  ///
  /// In en, this message translates to:
  /// **'Calculate optimal fertilizer amounts'**
  String get calculateOptimalFertilizerAmounts;

  /// No description provided for @irrigationScheduler.
  ///
  /// In en, this message translates to:
  /// **'Irrigation Scheduler'**
  String get irrigationScheduler;

  /// No description provided for @planManageIrrigationSchedules.
  ///
  /// In en, this message translates to:
  /// **'Plan and manage irrigation schedules'**
  String get planManageIrrigationSchedules;

  /// No description provided for @fieldDetails.
  ///
  /// In en, this message translates to:
  /// **'Field Details'**
  String get fieldDetails;

  /// No description provided for @fieldDetailsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'View and manage field information'**
  String get fieldDetailsSubtitle;

  /// No description provided for @growth.
  ///
  /// In en, this message translates to:
  /// **'Growth'**
  String get growth;

  /// No description provided for @analyzeGrowthPatterns.
  ///
  /// In en, this message translates to:
  /// **'Analyze growth patterns'**
  String get analyzeGrowthPatterns;

  /// No description provided for @experiments.
  ///
  /// In en, this message translates to:
  /// **'Experiments'**
  String get experiments;

  /// No description provided for @manageFieldExperiments.
  ///
  /// In en, this message translates to:
  /// **'Manage field experiments'**
  String get manageFieldExperiments;

  /// No description provided for @weeklyInsights.
  ///
  /// In en, this message translates to:
  /// **'Weekly Insights'**
  String get weeklyInsights;

  /// No description provided for @viewWeeklyAgriculturalInsights.
  ///
  /// In en, this message translates to:
  /// **'View weekly agricultural insights'**
  String get viewWeeklyAgriculturalInsights;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @fieldReportUpdated.
  ///
  /// In en, this message translates to:
  /// **'Field Report Updated'**
  String get fieldReportUpdated;

  /// No description provided for @updatedNDVIAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Updated NDVI analysis for Field #3'**
  String get updatedNDVIAnalysis;

  /// No description provided for @weatherAlert.
  ///
  /// In en, this message translates to:
  /// **'Weather Alert'**
  String get weatherAlert;

  /// No description provided for @heavyRainExpected.
  ///
  /// In en, this message translates to:
  /// **'Heavy rain expected tomorrow'**
  String get heavyRainExpected;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @weather.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get weather;

  /// No description provided for @plant.
  ///
  /// In en, this message translates to:
  /// **'Plant'**
  String get plant;

  /// No description provided for @tools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get tools;

  /// No description provided for @field.
  ///
  /// In en, this message translates to:
  /// **'Field'**
  String get field;

  /// No description provided for @high.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get high;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @low.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get low;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @analysis.
  ///
  /// In en, this message translates to:
  /// **'Analysis'**
  String get analysis;

  /// No description provided for @addNote.
  ///
  /// In en, this message translates to:
  /// **'Add Note'**
  String get addNote;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select category'**
  String get selectCategory;

  /// No description provided for @selectStatus.
  ///
  /// In en, this message translates to:
  /// **'Select status'**
  String get selectStatus;

  /// No description provided for @disease.
  ///
  /// In en, this message translates to:
  /// **'Disease'**
  String get disease;

  /// No description provided for @pest.
  ///
  /// In en, this message translates to:
  /// **'Pest'**
  String get pest;

  /// No description provided for @fertilization.
  ///
  /// In en, this message translates to:
  /// **'Fertilization'**
  String get fertilization;

  /// No description provided for @irrigation.
  ///
  /// In en, this message translates to:
  /// **'Irrigation'**
  String get irrigation;

  /// No description provided for @harvest.
  ///
  /// In en, this message translates to:
  /// **'Harvest'**
  String get harvest;

  /// No description provided for @weatherLabel.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get weatherLabel;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pending;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @urgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get urgent;

  /// No description provided for @inspection.
  ///
  /// In en, this message translates to:
  /// **'Inspection'**
  String get inspection;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @analyzeImage.
  ///
  /// In en, this message translates to:
  /// **'Analyze Image'**
  String get analyzeImage;

  /// No description provided for @noPhotoAdded.
  ///
  /// In en, this message translates to:
  /// **'No photo added'**
  String get noPhotoAdded;

  /// No description provided for @imageError.
  ///
  /// In en, this message translates to:
  /// **'Image error'**
  String get imageError;

  /// No description provided for @analyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing...'**
  String get analyzing;

  /// No description provided for @analysisCompleted.
  ///
  /// In en, this message translates to:
  /// **'Analysis completed successfully'**
  String get analysisCompleted;

  /// No description provided for @analysisFailed.
  ///
  /// In en, this message translates to:
  /// **'Analysis failed'**
  String get analysisFailed;

  /// No description provided for @growthRate.
  ///
  /// In en, this message translates to:
  /// **'Growth Rate'**
  String get growthRate;

  /// No description provided for @avgHeight.
  ///
  /// In en, this message translates to:
  /// **'Avg. Height'**
  String get avgHeight;

  /// No description provided for @growthStage.
  ///
  /// In en, this message translates to:
  /// **'Growth Stage'**
  String get growthStage;

  /// No description provided for @daysToHarvest.
  ///
  /// In en, this message translates to:
  /// **'Days to Harvest'**
  String get daysToHarvest;

  /// No description provided for @growthProgress.
  ///
  /// In en, this message translates to:
  /// **'Growth Progress'**
  String get growthProgress;

  /// No description provided for @growthStages.
  ///
  /// In en, this message translates to:
  /// **'Growth Stages'**
  String get growthStages;

  /// No description provided for @vegetative.
  ///
  /// In en, this message translates to:
  /// **'Vegetative'**
  String get vegetative;

  /// No description provided for @seeding.
  ///
  /// In en, this message translates to:
  /// **'Seeding'**
  String get seeding;

  /// No description provided for @germination.
  ///
  /// In en, this message translates to:
  /// **'Germination'**
  String get germination;

  /// No description provided for @flowering.
  ///
  /// In en, this message translates to:
  /// **'Flowering'**
  String get flowering;

  /// No description provided for @harvestReady.
  ///
  /// In en, this message translates to:
  /// **'Harvest'**
  String get harvestReady;

  /// No description provided for @recommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get recommendations;

  /// No description provided for @fieldExperiments.
  ///
  /// In en, this message translates to:
  /// **'Field Experiments'**
  String get fieldExperiments;

  /// No description provided for @experimentSummary.
  ///
  /// In en, this message translates to:
  /// **'Experiment Summary'**
  String get experimentSummary;

  /// No description provided for @active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get active;

  /// No description provided for @completedExperiments.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completedExperiments;

  /// No description provided for @failed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get failed;

  /// No description provided for @recentExperiments.
  ///
  /// In en, this message translates to:
  /// **'Recent Experiments'**
  String get recentExperiments;

  /// No description provided for @createNewExperiment.
  ///
  /// In en, this message translates to:
  /// **'Create New Experiment'**
  String get createNewExperiment;

  /// No description provided for @insightsFromExperiments.
  ///
  /// In en, this message translates to:
  /// **'Insights from Experiments'**
  String get insightsFromExperiments;

  /// No description provided for @weeklyInsightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly Insights'**
  String get weeklyInsightsTitle;

  /// No description provided for @keyInsights.
  ///
  /// In en, this message translates to:
  /// **'Key Insights'**
  String get keyInsights;

  /// No description provided for @weatherImpact.
  ///
  /// In en, this message translates to:
  /// **'Weather Impact'**
  String get weatherImpact;

  /// No description provided for @growthRateLabel.
  ///
  /// In en, this message translates to:
  /// **'Growth Rate'**
  String get growthRateLabel;

  /// No description provided for @pestAlert.
  ///
  /// In en, this message translates to:
  /// **'Pest Alert'**
  String get pestAlert;

  /// No description provided for @irrigationLabel.
  ///
  /// In en, this message translates to:
  /// **'Irrigation'**
  String get irrigationLabel;

  /// No description provided for @weeklyActivities.
  ///
  /// In en, this message translates to:
  /// **'Weekly Activities'**
  String get weeklyActivities;

  /// No description provided for @weatherForecast.
  ///
  /// In en, this message translates to:
  /// **'Weather Forecast'**
  String get weatherForecast;

  /// No description provided for @addNoteForZone.
  ///
  /// In en, this message translates to:
  /// **'Add Note for Zone {zoneNumber}'**
  String addNoteForZone(Object zoneNumber);

  /// No description provided for @fieldInformation.
  ///
  /// In en, this message translates to:
  /// **'Field Information'**
  String get fieldInformation;

  /// No description provided for @fieldId.
  ///
  /// In en, this message translates to:
  /// **'Field ID'**
  String get fieldId;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @cropType.
  ///
  /// In en, this message translates to:
  /// **'Crop Type'**
  String get cropType;

  /// No description provided for @plantingDate.
  ///
  /// In en, this message translates to:
  /// **'Planting Date'**
  String get plantingDate;

  /// No description provided for @growthStageLabel.
  ///
  /// In en, this message translates to:
  /// **'Growth Stage'**
  String get growthStageLabel;

  /// No description provided for @fieldStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Field Status'**
  String get fieldStatusLabel;

  /// No description provided for @recentActivitiesLabel.
  ///
  /// In en, this message translates to:
  /// **'Recent Activities'**
  String get recentActivitiesLabel;

  /// No description provided for @fieldActions.
  ///
  /// In en, this message translates to:
  /// **'Field Actions'**
  String get fieldActions;

  /// No description provided for @soilAnalysisAction.
  ///
  /// In en, this message translates to:
  /// **'Soil Analysis'**
  String get soilAnalysisAction;

  /// No description provided for @ndviScan.
  ///
  /// In en, this message translates to:
  /// **'NDVI Scan'**
  String get ndviScan;

  /// No description provided for @pestControl.
  ///
  /// In en, this message translates to:
  /// **'Pest Control'**
  String get pestControl;

  /// No description provided for @irrigationAction.
  ///
  /// In en, this message translates to:
  /// **'Irrigation'**
  String get irrigationAction;

  /// No description provided for @current.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get current;

  /// No description provided for @pestsDetected.
  ///
  /// In en, this message translates to:
  /// **'Pests Detected'**
  String get pestsDetected;

  /// No description provided for @diseasesDetected.
  ///
  /// In en, this message translates to:
  /// **'Diseases Detected'**
  String get diseasesDetected;

  /// No description provided for @noIssuesDetected.
  ///
  /// In en, this message translates to:
  /// **'No Issues Detected'**
  String get noIssuesDetected;

  /// No description provided for @pestName.
  ///
  /// In en, this message translates to:
  /// **'Pest Name'**
  String get pestName;

  /// No description provided for @diseaseName.
  ///
  /// In en, this message translates to:
  /// **'Disease Name'**
  String get diseaseName;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @severity.
  ///
  /// In en, this message translates to:
  /// **'Severity'**
  String get severity;

  /// No description provided for @treatmentRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Treatment Recommendations'**
  String get treatmentRecommendations;

  /// No description provided for @preventionTips.
  ///
  /// In en, this message translates to:
  /// **'Prevention Tips'**
  String get preventionTips;

  /// No description provided for @applyTreatment.
  ///
  /// In en, this message translates to:
  /// **'Apply Treatment'**
  String get applyTreatment;

  /// No description provided for @monitorClosely.
  ///
  /// In en, this message translates to:
  /// **'Monitor Closely'**
  String get monitorClosely;

  /// No description provided for @noTreatmentNeeded.
  ///
  /// In en, this message translates to:
  /// **'No Treatment Needed'**
  String get noTreatmentNeeded;

  /// No description provided for @treatmentApplied.
  ///
  /// In en, this message translates to:
  /// **'Treatment Applied'**
  String get treatmentApplied;

  /// No description provided for @pestAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'Pest Alert'**
  String get pestAlertTitle;

  /// No description provided for @diseaseAlertTitle.
  ///
  /// In en, this message translates to:
  /// **'Disease Alert'**
  String get diseaseAlertTitle;

  /// No description provided for @soilAnalysisTitle.
  ///
  /// In en, this message translates to:
  /// **'Soil Analysis'**
  String get soilAnalysisTitle;

  /// No description provided for @results.
  ///
  /// In en, this message translates to:
  /// **'Results'**
  String get results;

  /// No description provided for @recommendation.
  ///
  /// In en, this message translates to:
  /// **'Recommendation'**
  String get recommendation;

  /// No description provided for @fertilizerCalculatorTitle.
  ///
  /// In en, this message translates to:
  /// **'Fertilizer Calculator'**
  String get fertilizerCalculatorTitle;

  /// No description provided for @calculateFertilizerRequirements.
  ///
  /// In en, this message translates to:
  /// **'Calculate Fertilizer Requirements'**
  String get calculateFertilizerRequirements;

  /// No description provided for @fieldArea.
  ///
  /// In en, this message translates to:
  /// **'Field Area (hectares)'**
  String get fieldArea;

  /// No description provided for @enterFieldArea.
  ///
  /// In en, this message translates to:
  /// **'Enter field area'**
  String get enterFieldArea;

  /// No description provided for @cropTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Crop Type'**
  String get cropTypeLabel;

  /// No description provided for @selectCropType.
  ///
  /// In en, this message translates to:
  /// **'Select crop type'**
  String get selectCropType;

  /// No description provided for @fertilizerType.
  ///
  /// In en, this message translates to:
  /// **'Fertilizer Type'**
  String get fertilizerType;

  /// No description provided for @selectFertilizerType.
  ///
  /// In en, this message translates to:
  /// **'Select fertilizer type'**
  String get selectFertilizerType;

  /// No description provided for @nutrientRequirements.
  ///
  /// In en, this message translates to:
  /// **'Nutrient Requirements (kg/hectare)'**
  String get nutrientRequirements;

  /// No description provided for @nitrogen.
  ///
  /// In en, this message translates to:
  /// **'N'**
  String get nitrogen;

  /// No description provided for @phosphorus.
  ///
  /// In en, this message translates to:
  /// **'P'**
  String get phosphorus;

  /// No description provided for @potassium.
  ///
  /// In en, this message translates to:
  /// **'K'**
  String get potassium;

  /// No description provided for @calculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculate;

  /// No description provided for @calculationResults.
  ///
  /// In en, this message translates to:
  /// **'Calculation Results'**
  String get calculationResults;

  /// No description provided for @recommendedFertilizerAmount.
  ///
  /// In en, this message translates to:
  /// **'Recommended Fertilizer Amount'**
  String get recommendedFertilizerAmount;

  /// No description provided for @irrigationSchedulerTitle.
  ///
  /// In en, this message translates to:
  /// **'Irrigation Scheduler'**
  String get irrigationSchedulerTitle;

  /// No description provided for @planIrrigationSchedule.
  ///
  /// In en, this message translates to:
  /// **'Plan Your Irrigation Schedule'**
  String get planIrrigationSchedule;

  /// No description provided for @soilType.
  ///
  /// In en, this message translates to:
  /// **'Soil Type'**
  String get soilType;

  /// No description provided for @enterSoilType.
  ///
  /// In en, this message translates to:
  /// **'Enter soil type'**
  String get enterSoilType;

  /// No description provided for @irrigationMethod.
  ///
  /// In en, this message translates to:
  /// **'Irrigation Method'**
  String get irrigationMethod;

  /// No description provided for @selectIrrigationMethod.
  ///
  /// In en, this message translates to:
  /// **'Select irrigation method'**
  String get selectIrrigationMethod;

  /// No description provided for @drip.
  ///
  /// In en, this message translates to:
  /// **'Drip'**
  String get drip;

  /// No description provided for @sprinkler.
  ///
  /// In en, this message translates to:
  /// **'Sprinkler'**
  String get sprinkler;

  /// No description provided for @furrow.
  ///
  /// In en, this message translates to:
  /// **'Furrow'**
  String get furrow;

  /// No description provided for @flood.
  ///
  /// In en, this message translates to:
  /// **'Flood'**
  String get flood;

  /// No description provided for @selectPlantingDate.
  ///
  /// In en, this message translates to:
  /// **'Select Planting Date'**
  String get selectPlantingDate;

  /// No description provided for @generateSchedule.
  ///
  /// In en, this message translates to:
  /// **'Generate Schedule'**
  String get generateSchedule;

  /// No description provided for @irrigationRequirements.
  ///
  /// In en, this message translates to:
  /// **'Irrigation Requirements'**
  String get irrigationRequirements;

  /// No description provided for @totalWaterNeeded.
  ///
  /// In en, this message translates to:
  /// **'Total Water Needed'**
  String get totalWaterNeeded;

  /// No description provided for @dailyAvg.
  ///
  /// In en, this message translates to:
  /// **'Daily Avg.'**
  String get dailyAvg;

  /// No description provided for @irrigationSchedule.
  ///
  /// In en, this message translates to:
  /// **'Irrigation Schedule'**
  String get irrigationSchedule;

  /// No description provided for @saveSchedule.
  ///
  /// In en, this message translates to:
  /// **'Save Schedule'**
  String get saveSchedule;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @method.
  ///
  /// In en, this message translates to:
  /// **'Method'**
  String get method;

  /// No description provided for @pendingStatus.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get pendingStatus;

  /// No description provided for @irrigationTips.
  ///
  /// In en, this message translates to:
  /// **'Irrigation Tips'**
  String get irrigationTips;

  /// No description provided for @earlyMorningWatering.
  ///
  /// In en, this message translates to:
  /// **'Early Morning Watering'**
  String get earlyMorningWatering;

  /// No description provided for @earlyMorningWateringDesc.
  ///
  /// In en, this message translates to:
  /// **'Water early in the morning to reduce evaporation losses'**
  String get earlyMorningWateringDesc;

  /// No description provided for @soilMoistureMonitoring.
  ///
  /// In en, this message translates to:
  /// **'Soil Moisture Monitoring'**
  String get soilMoistureMonitoring;

  /// No description provided for @soilMoistureDesc.
  ///
  /// In en, this message translates to:
  /// **'Use soil moisture sensors to optimize irrigation timing'**
  String get soilMoistureDesc;

  /// No description provided for @weatherAdjustment.
  ///
  /// In en, this message translates to:
  /// **'Weather Adjustment'**
  String get weatherAdjustment;

  /// No description provided for @weatherAdjustmentDesc.
  ///
  /// In en, this message translates to:
  /// **'Adjust schedule based on weather conditions and rainfall'**
  String get weatherAdjustmentDesc;

  /// No description provided for @waterConservation.
  ///
  /// In en, this message translates to:
  /// **'Water Conservation'**
  String get waterConservation;

  /// No description provided for @waterConservationDesc.
  ///
  /// In en, this message translates to:
  /// **'Implement water-saving techniques to reduce consumption'**
  String get waterConservationDesc;

  /// No description provided for @growthAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Growth Analysis'**
  String get growthAnalysis;

  /// No description provided for @growthSummary.
  ///
  /// In en, this message translates to:
  /// **'Growth Summary'**
  String get growthSummary;

  /// No description provided for @growthChart.
  ///
  /// In en, this message translates to:
  /// **'Growth Trend Chart'**
  String get growthChart;

  /// No description provided for @heightOverTime.
  ///
  /// In en, this message translates to:
  /// **'Height over time'**
  String get heightOverTime;

  /// No description provided for @fieldExperimentsTitle.
  ///
  /// In en, this message translates to:
  /// **'Field Experiments'**
  String get fieldExperimentsTitle;

  /// No description provided for @experimentsSummary.
  ///
  /// In en, this message translates to:
  /// **'Experiment Summary'**
  String get experimentsSummary;

  /// No description provided for @addNoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Note'**
  String get addNoteTitle;

  /// No description provided for @noteContent.
  ///
  /// In en, this message translates to:
  /// **'Note Content'**
  String get noteContent;

  /// No description provided for @selectPhoto.
  ///
  /// In en, this message translates to:
  /// **'Select Photo'**
  String get selectPhoto;

  /// No description provided for @capturePhoto.
  ///
  /// In en, this message translates to:
  /// **'Capture Photo'**
  String get capturePhoto;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// No description provided for @fromGallery.
  ///
  /// In en, this message translates to:
  /// **'From Gallery'**
  String get fromGallery;

  /// No description provided for @fieldDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Field Details'**
  String get fieldDetailsTitle;

  /// No description provided for @mapPreview.
  ///
  /// In en, this message translates to:
  /// **'Map Preview'**
  String get mapPreview;

  /// No description provided for @fieldData.
  ///
  /// In en, this message translates to:
  /// **'Field Data'**
  String get fieldData;

  /// No description provided for @statusSummary.
  ///
  /// In en, this message translates to:
  /// **'Status Summary'**
  String get statusSummary;

  /// No description provided for @healthy.
  ///
  /// In en, this message translates to:
  /// **'Healthy'**
  String get healthy;

  /// No description provided for @growthStatus.
  ///
  /// In en, this message translates to:
  /// **'Growth Status'**
  String get growthStatus;

  /// No description provided for @moistureLevel.
  ///
  /// In en, this message translates to:
  /// **'Moisture Level'**
  String get moistureLevel;

  /// No description provided for @moisture.
  ///
  /// In en, this message translates to:
  /// **'Moisture'**
  String get moisture;

  /// No description provided for @fieldActionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Field Actions'**
  String get fieldActionsTitle;

  /// No description provided for @soilAnalysisActionTitle.
  ///
  /// In en, this message translates to:
  /// **'Soil Analysis'**
  String get soilAnalysisActionTitle;

  /// No description provided for @pestControlAction.
  ///
  /// In en, this message translates to:
  /// **'Pest Control'**
  String get pestControlAction;

  /// No description provided for @irrigationActionTitle.
  ///
  /// In en, this message translates to:
  /// **'Irrigation'**
  String get irrigationActionTitle;

  /// No description provided for @growthMonitoring.
  ///
  /// In en, this message translates to:
  /// **'Growth Monitoring'**
  String get growthMonitoring;

  /// No description provided for @pestMonitoring.
  ///
  /// In en, this message translates to:
  /// **'Pest Monitoring'**
  String get pestMonitoring;

  /// No description provided for @diseaseMonitoring.
  ///
  /// In en, this message translates to:
  /// **'Disease Monitoring'**
  String get diseaseMonitoring;

  /// No description provided for @fertilizerManagement.
  ///
  /// In en, this message translates to:
  /// **'Fertilizer Management'**
  String get fertilizerManagement;

  /// No description provided for @harvestPlanning.
  ///
  /// In en, this message translates to:
  /// **'Harvest Planning'**
  String get harvestPlanning;

  /// No description provided for @weatherMonitoring.
  ///
  /// In en, this message translates to:
  /// **'Weather Monitoring'**
  String get weatherMonitoring;

  /// No description provided for @fieldAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Field Analytics'**
  String get fieldAnalytics;

  /// No description provided for @analyticsForZone.
  ///
  /// In en, this message translates to:
  /// **'Analytics for Zone {zoneNumber}'**
  String analyticsForZone(Object zoneNumber);

  /// No description provided for @recentAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Recent Analytics'**
  String get recentAnalytics;

  /// No description provided for @fieldCondition.
  ///
  /// In en, this message translates to:
  /// **'Field Condition'**
  String get fieldCondition;

  /// No description provided for @plantHealthStatus.
  ///
  /// In en, this message translates to:
  /// **'Plant health status'**
  String get plantHealthStatus;

  /// No description provided for @yield.
  ///
  /// In en, this message translates to:
  /// **'Yield'**
  String get yield;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @areaLabel.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get areaLabel;

  /// No description provided for @temperature.
  ///
  /// In en, this message translates to:
  /// **'Temperature'**
  String get temperature;

  /// No description provided for @temp.
  ///
  /// In en, this message translates to:
  /// **'Temp'**
  String get temp;

  /// No description provided for @ndvi.
  ///
  /// In en, this message translates to:
  /// **'NDVI'**
  String get ndvi;

  /// No description provided for @moisturePercentage.
  ///
  /// In en, this message translates to:
  /// **'Moisture %'**
  String get moisturePercentage;

  /// No description provided for @growthCmPerDay.
  ///
  /// In en, this message translates to:
  /// **'Growth cm/day'**
  String get growthCmPerDay;

  /// No description provided for @good.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get good;

  /// No description provided for @fair.
  ///
  /// In en, this message translates to:
  /// **'Fair'**
  String get fair;

  /// No description provided for @poor.
  ///
  /// In en, this message translates to:
  /// **'Poor'**
  String get poor;

  /// No description provided for @none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// No description provided for @issues.
  ///
  /// In en, this message translates to:
  /// **'Issues'**
  String get issues;

  /// No description provided for @pestActivity.
  ///
  /// In en, this message translates to:
  /// **'Pest activity'**
  String get pestActivity;

  /// No description provided for @diseaseDetected.
  ///
  /// In en, this message translates to:
  /// **'Disease detected'**
  String get diseaseDetected;

  /// No description provided for @growthIssues.
  ///
  /// In en, this message translates to:
  /// **'Growth issues'**
  String get growthIssues;

  /// No description provided for @nutrientDeficiency.
  ///
  /// In en, this message translates to:
  /// **'Nutrient deficiency'**
  String get nutrientDeficiency;

  /// No description provided for @waterStress.
  ///
  /// In en, this message translates to:
  /// **'Water stress'**
  String get waterStress;

  /// No description provided for @optimal.
  ///
  /// In en, this message translates to:
  /// **'Optimal'**
  String get optimal;

  /// No description provided for @suboptimal.
  ///
  /// In en, this message translates to:
  /// **'Suboptimal'**
  String get suboptimal;

  /// No description provided for @critical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get critical;

  /// No description provided for @minor.
  ///
  /// In en, this message translates to:
  /// **'Minor'**
  String get minor;

  /// No description provided for @moderate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get moderate;

  /// No description provided for @major.
  ///
  /// In en, this message translates to:
  /// **'Major'**
  String get major;

  /// No description provided for @veryHigh.
  ///
  /// In en, this message translates to:
  /// **'Very High'**
  String get veryHigh;

  /// No description provided for @veryLow.
  ///
  /// In en, this message translates to:
  /// **'Very Low'**
  String get veryLow;

  /// No description provided for @excellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get excellent;

  /// No description provided for @average.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get average;

  /// No description provided for @belowAverage.
  ///
  /// In en, this message translates to:
  /// **'Below Average'**
  String get belowAverage;

  /// No description provided for @aboveAverage.
  ///
  /// In en, this message translates to:
  /// **'Above Average'**
  String get aboveAverage;

  /// No description provided for @outstanding.
  ///
  /// In en, this message translates to:
  /// **'Outstanding'**
  String get outstanding;

  /// No description provided for @satisfactory.
  ///
  /// In en, this message translates to:
  /// **'Satisfactory'**
  String get satisfactory;

  /// No description provided for @unsatisfactory.
  ///
  /// In en, this message translates to:
  /// **'Unsatisfactory'**
  String get unsatisfactory;

  /// No description provided for @acceptable.
  ///
  /// In en, this message translates to:
  /// **'Acceptable'**
  String get acceptable;

  /// No description provided for @requiresAttention.
  ///
  /// In en, this message translates to:
  /// **'Requires Attention'**
  String get requiresAttention;

  /// No description provided for @needsImprovement.
  ///
  /// In en, this message translates to:
  /// **'Needs Improvement'**
  String get needsImprovement;

  /// No description provided for @satisfactoryCondition.
  ///
  /// In en, this message translates to:
  /// **'Satisfactory Condition'**
  String get satisfactoryCondition;

  /// No description provided for @requiresTreatment.
  ///
  /// In en, this message translates to:
  /// **'Requires Treatment'**
  String get requiresTreatment;

  /// No description provided for @underObservation.
  ///
  /// In en, this message translates to:
  /// **'Under Observation'**
  String get underObservation;

  /// No description provided for @inGoodCondition.
  ///
  /// In en, this message translates to:
  /// **'In Good Condition'**
  String get inGoodCondition;

  /// No description provided for @requiresMonitoring.
  ///
  /// In en, this message translates to:
  /// **'Requires Monitoring'**
  String get requiresMonitoring;

  /// No description provided for @optimalConditions.
  ///
  /// In en, this message translates to:
  /// **'Optimal Conditions'**
  String get optimalConditions;

  /// No description provided for @suboptimalConditions.
  ///
  /// In en, this message translates to:
  /// **'Suboptimal Conditions'**
  String get suboptimalConditions;

  /// No description provided for @criticalConditions.
  ///
  /// In en, this message translates to:
  /// **'Critical Conditions'**
  String get criticalConditions;

  /// No description provided for @growing.
  ///
  /// In en, this message translates to:
  /// **'Growing'**
  String get growing;

  /// No description provided for @maturing.
  ///
  /// In en, this message translates to:
  /// **'Maturing'**
  String get maturing;

  /// No description provided for @readyForHarvest.
  ///
  /// In en, this message translates to:
  /// **'Ready for Harvest'**
  String get readyForHarvest;

  /// No description provided for @harvested.
  ///
  /// In en, this message translates to:
  /// **'Harvested'**
  String get harvested;

  /// No description provided for @planned.
  ///
  /// In en, this message translates to:
  /// **'Planned'**
  String get planned;

  /// No description provided for @scheduled.
  ///
  /// In en, this message translates to:
  /// **'Scheduled'**
  String get scheduled;

  /// No description provided for @inProcess.
  ///
  /// In en, this message translates to:
  /// **'In Process'**
  String get inProcess;

  /// No description provided for @finished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get finished;

  /// No description provided for @cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get cancelled;

  /// No description provided for @postponed.
  ///
  /// In en, this message translates to:
  /// **'Postponed'**
  String get postponed;

  /// No description provided for @delayed.
  ///
  /// In en, this message translates to:
  /// **'Delayed'**
  String get delayed;

  /// No description provided for @onSchedule.
  ///
  /// In en, this message translates to:
  /// **'On Schedule'**
  String get onSchedule;

  /// No description provided for @aheadOfSchedule.
  ///
  /// In en, this message translates to:
  /// **'Ahead of Schedule'**
  String get aheadOfSchedule;

  /// No description provided for @behindSchedule.
  ///
  /// In en, this message translates to:
  /// **'Behind Schedule'**
  String get behindSchedule;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @abnormal.
  ///
  /// In en, this message translates to:
  /// **'Abnormal'**
  String get abnormal;

  /// No description provided for @stable.
  ///
  /// In en, this message translates to:
  /// **'Stable'**
  String get stable;

  /// No description provided for @unstable.
  ///
  /// In en, this message translates to:
  /// **'Unstable'**
  String get unstable;

  /// No description provided for @increasing.
  ///
  /// In en, this message translates to:
  /// **'Increasing'**
  String get increasing;

  /// No description provided for @decreasing.
  ///
  /// In en, this message translates to:
  /// **'Decreasing'**
  String get decreasing;

  /// No description provided for @fluctuating.
  ///
  /// In en, this message translates to:
  /// **'Fluctuating'**
  String get fluctuating;

  /// No description provided for @improving.
  ///
  /// In en, this message translates to:
  /// **'Improving'**
  String get improving;

  /// No description provided for @deteriorating.
  ///
  /// In en, this message translates to:
  /// **'Deteriorating'**
  String get deteriorating;

  /// No description provided for @maintaining.
  ///
  /// In en, this message translates to:
  /// **'Maintaining'**
  String get maintaining;

  /// No description provided for @optimalMoisture.
  ///
  /// In en, this message translates to:
  /// **'Optimal Moisture'**
  String get optimalMoisture;

  /// No description provided for @dry.
  ///
  /// In en, this message translates to:
  /// **'Dry'**
  String get dry;

  /// No description provided for @wet.
  ///
  /// In en, this message translates to:
  /// **'Wet'**
  String get wet;

  /// No description provided for @soggy.
  ///
  /// In en, this message translates to:
  /// **'Soggy'**
  String get soggy;

  /// No description provided for @wellWatered.
  ///
  /// In en, this message translates to:
  /// **'Well Watered'**
  String get wellWatered;

  /// No description provided for @underWatered.
  ///
  /// In en, this message translates to:
  /// **'Under Watered'**
  String get underWatered;

  /// No description provided for @overWatered.
  ///
  /// In en, this message translates to:
  /// **'Over Watered'**
  String get overWatered;

  /// No description provided for @adequate.
  ///
  /// In en, this message translates to:
  /// **'Adequate'**
  String get adequate;

  /// No description provided for @inadequate.
  ///
  /// In en, this message translates to:
  /// **'Inadequate'**
  String get inadequate;

  /// No description provided for @sufficient.
  ///
  /// In en, this message translates to:
  /// **'Sufficient'**
  String get sufficient;

  /// No description provided for @insufficient.
  ///
  /// In en, this message translates to:
  /// **'Insufficient'**
  String get insufficient;

  /// No description provided for @plentiful.
  ///
  /// In en, this message translates to:
  /// **'Plentiful'**
  String get plentiful;

  /// No description provided for @sparse.
  ///
  /// In en, this message translates to:
  /// **'Sparse'**
  String get sparse;

  /// No description provided for @abundant.
  ///
  /// In en, this message translates to:
  /// **'Abundant'**
  String get abundant;

  /// No description provided for @deficient.
  ///
  /// In en, this message translates to:
  /// **'Deficient'**
  String get deficient;

  /// No description provided for @rich.
  ///
  /// In en, this message translates to:
  /// **'Rich'**
  String get rich;

  /// No description provided for @poorSoil.
  ///
  /// In en, this message translates to:
  /// **'Poor Soil'**
  String get poorSoil;

  /// No description provided for @fertile.
  ///
  /// In en, this message translates to:
  /// **'Fertile'**
  String get fertile;

  /// No description provided for @infertile.
  ///
  /// In en, this message translates to:
  /// **'Infertile'**
  String get infertile;

  /// No description provided for @nutrientRich.
  ///
  /// In en, this message translates to:
  /// **'Nutrient Rich'**
  String get nutrientRich;

  /// No description provided for @nutrientPoor.
  ///
  /// In en, this message translates to:
  /// **'Nutrient Poor'**
  String get nutrientPoor;

  /// No description provided for @balanced.
  ///
  /// In en, this message translates to:
  /// **'Balanced'**
  String get balanced;

  /// No description provided for @unbalanced.
  ///
  /// In en, this message translates to:
  /// **'Unbalanced'**
  String get unbalanced;

  /// No description provided for @healthyGrowth.
  ///
  /// In en, this message translates to:
  /// **'Healthy Growth'**
  String get healthyGrowth;

  /// No description provided for @stuntedGrowth.
  ///
  /// In en, this message translates to:
  /// **'Stunted Growth'**
  String get stuntedGrowth;

  /// No description provided for @vigorous.
  ///
  /// In en, this message translates to:
  /// **'Vigorous'**
  String get vigorous;

  /// No description provided for @weak.
  ///
  /// In en, this message translates to:
  /// **'Weak'**
  String get weak;

  /// No description provided for @strong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get strong;

  /// No description provided for @fragile.
  ///
  /// In en, this message translates to:
  /// **'Fragile'**
  String get fragile;

  /// No description provided for @robust.
  ///
  /// In en, this message translates to:
  /// **'Robust'**
  String get robust;

  /// No description provided for @resilient.
  ///
  /// In en, this message translates to:
  /// **'Resilient'**
  String get resilient;

  /// No description provided for @vulnerable.
  ///
  /// In en, this message translates to:
  /// **'Vulnerable'**
  String get vulnerable;

  /// No description provided for @diseaseResistant.
  ///
  /// In en, this message translates to:
  /// **'Disease Resistant'**
  String get diseaseResistant;

  /// No description provided for @diseaseSusceptible.
  ///
  /// In en, this message translates to:
  /// **'Disease Susceptible'**
  String get diseaseSusceptible;

  /// No description provided for @pestResistant.
  ///
  /// In en, this message translates to:
  /// **'Pest Resistant'**
  String get pestResistant;

  /// No description provided for @pestSusceptible.
  ///
  /// In en, this message translates to:
  /// **'Pest Susceptible'**
  String get pestSusceptible;

  /// No description provided for @droughtTolerant.
  ///
  /// In en, this message translates to:
  /// **'Drought Tolerant'**
  String get droughtTolerant;

  /// No description provided for @droughtSensitive.
  ///
  /// In en, this message translates to:
  /// **'Drought Sensitive'**
  String get droughtSensitive;

  /// No description provided for @coldTolerant.
  ///
  /// In en, this message translates to:
  /// **'Cold Tolerant'**
  String get coldTolerant;

  /// No description provided for @coldSensitive.
  ///
  /// In en, this message translates to:
  /// **'Cold Sensitive'**
  String get coldSensitive;

  /// No description provided for @heatTolerant.
  ///
  /// In en, this message translates to:
  /// **'Heat Tolerant'**
  String get heatTolerant;

  /// No description provided for @heatSensitive.
  ///
  /// In en, this message translates to:
  /// **'Heat Sensitive'**
  String get heatSensitive;

  /// No description provided for @windResistant.
  ///
  /// In en, this message translates to:
  /// **'Wind Resistant'**
  String get windResistant;

  /// No description provided for @windSensitive.
  ///
  /// In en, this message translates to:
  /// **'Wind Sensitive'**
  String get windSensitive;

  /// No description provided for @sunLoving.
  ///
  /// In en, this message translates to:
  /// **'Sun Loving'**
  String get sunLoving;

  /// No description provided for @shadeTolerant.
  ///
  /// In en, this message translates to:
  /// **'Shade Tolerant'**
  String get shadeTolerant;

  /// No description provided for @frostResistant.
  ///
  /// In en, this message translates to:
  /// **'Frost Resistant'**
  String get frostResistant;

  /// No description provided for @frostSensitive.
  ///
  /// In en, this message translates to:
  /// **'Frost Sensitive'**
  String get frostSensitive;

  /// No description provided for @saltTolerant.
  ///
  /// In en, this message translates to:
  /// **'Salt Tolerant'**
  String get saltTolerant;

  /// No description provided for @saltSensitive.
  ///
  /// In en, this message translates to:
  /// **'Salt Sensitive'**
  String get saltSensitive;

  /// No description provided for @alkalineTolerant.
  ///
  /// In en, this message translates to:
  /// **'Alkaline Tolerant'**
  String get alkalineTolerant;

  /// No description provided for @alkalineSensitive.
  ///
  /// In en, this message translates to:
  /// **'Alkaline Sensitive'**
  String get alkalineSensitive;

  /// No description provided for @acidLoving.
  ///
  /// In en, this message translates to:
  /// **'Acid Loving'**
  String get acidLoving;

  /// No description provided for @acidSensitive.
  ///
  /// In en, this message translates to:
  /// **'Acid Sensitive'**
  String get acidSensitive;

  /// No description provided for @pestFree.
  ///
  /// In en, this message translates to:
  /// **'Pest Free'**
  String get pestFree;

  /// No description provided for @diseaseFree.
  ///
  /// In en, this message translates to:
  /// **'Disease Free'**
  String get diseaseFree;

  /// No description provided for @pestPresent.
  ///
  /// In en, this message translates to:
  /// **'Pest Present'**
  String get pestPresent;

  /// No description provided for @diseasePresent.
  ///
  /// In en, this message translates to:
  /// **'Disease Present'**
  String get diseasePresent;

  /// No description provided for @minorInfestation.
  ///
  /// In en, this message translates to:
  /// **'Minor Infestation'**
  String get minorInfestation;

  /// No description provided for @moderateInfestation.
  ///
  /// In en, this message translates to:
  /// **'Moderate Infestation'**
  String get moderateInfestation;

  /// No description provided for @severeInfestation.
  ///
  /// In en, this message translates to:
  /// **'Severe Infestation'**
  String get severeInfestation;

  /// No description provided for @minorDisease.
  ///
  /// In en, this message translates to:
  /// **'Minor Disease'**
  String get minorDisease;

  /// No description provided for @moderateDisease.
  ///
  /// In en, this message translates to:
  /// **'Moderate Disease'**
  String get moderateDisease;

  /// No description provided for @severeDisease.
  ///
  /// In en, this message translates to:
  /// **'Severe Disease'**
  String get severeDisease;

  /// No description provided for @earlyStage.
  ///
  /// In en, this message translates to:
  /// **'Early Stage'**
  String get earlyStage;

  /// No description provided for @midStage.
  ///
  /// In en, this message translates to:
  /// **'Mid Stage'**
  String get midStage;

  /// No description provided for @lateStage.
  ///
  /// In en, this message translates to:
  /// **'Late Stage'**
  String get lateStage;

  /// No description provided for @initialStage.
  ///
  /// In en, this message translates to:
  /// **'Initial Stage'**
  String get initialStage;

  /// No description provided for @advancedStage.
  ///
  /// In en, this message translates to:
  /// **'Advanced Stage'**
  String get advancedStage;

  /// No description provided for @endStage.
  ///
  /// In en, this message translates to:
  /// **'End Stage'**
  String get endStage;

  /// No description provided for @beginning.
  ///
  /// In en, this message translates to:
  /// **'Beginning'**
  String get beginning;

  /// No description provided for @middle.
  ///
  /// In en, this message translates to:
  /// **'Middle'**
  String get middle;

  /// No description provided for @end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get complete;

  /// No description provided for @incomplete.
  ///
  /// In en, this message translates to:
  /// **'Incomplete'**
  String get incomplete;

  /// No description provided for @ready.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get ready;

  /// No description provided for @notReady.
  ///
  /// In en, this message translates to:
  /// **'Not Ready'**
  String get notReady;

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @unavailable.
  ///
  /// In en, this message translates to:
  /// **'Unavailable'**
  String get unavailable;

  /// No description provided for @accessible.
  ///
  /// In en, this message translates to:
  /// **'Accessible'**
  String get accessible;

  /// No description provided for @inaccessible.
  ///
  /// In en, this message translates to:
  /// **'Inaccessible'**
  String get inaccessible;

  /// No description provided for @usable.
  ///
  /// In en, this message translates to:
  /// **'Usable'**
  String get usable;

  /// No description provided for @unusable.
  ///
  /// In en, this message translates to:
  /// **'Unusable'**
  String get unusable;

  /// No description provided for @effective.
  ///
  /// In en, this message translates to:
  /// **'Effective'**
  String get effective;

  /// No description provided for @ineffective.
  ///
  /// In en, this message translates to:
  /// **'Ineffective'**
  String get ineffective;

  /// No description provided for @efficient.
  ///
  /// In en, this message translates to:
  /// **'Efficient'**
  String get efficient;

  /// No description provided for @inefficient.
  ///
  /// In en, this message translates to:
  /// **'Inefficient'**
  String get inefficient;

  /// No description provided for @productive.
  ///
  /// In en, this message translates to:
  /// **'Productive'**
  String get productive;

  /// No description provided for @unproductive.
  ///
  /// In en, this message translates to:
  /// **'Unproductive'**
  String get unproductive;

  /// No description provided for @profitable.
  ///
  /// In en, this message translates to:
  /// **'Profitable'**
  String get profitable;

  /// No description provided for @unprofitable.
  ///
  /// In en, this message translates to:
  /// **'Unprofitable'**
  String get unprofitable;

  /// No description provided for @sustainable.
  ///
  /// In en, this message translates to:
  /// **'Sustainable'**
  String get sustainable;

  /// No description provided for @unsustainable.
  ///
  /// In en, this message translates to:
  /// **'Unsustainable'**
  String get unsustainable;

  /// No description provided for @environmentallyFriendly.
  ///
  /// In en, this message translates to:
  /// **'Environmentally Friendly'**
  String get environmentallyFriendly;

  /// No description provided for @notEnvironmentallyFriendly.
  ///
  /// In en, this message translates to:
  /// **'Not Environmentally Friendly'**
  String get notEnvironmentallyFriendly;

  /// No description provided for @costEffective.
  ///
  /// In en, this message translates to:
  /// **'Cost Effective'**
  String get costEffective;

  /// No description provided for @notCostEffective.
  ///
  /// In en, this message translates to:
  /// **'Not Cost Effective'**
  String get notCostEffective;

  /// No description provided for @timeEfficient.
  ///
  /// In en, this message translates to:
  /// **'Time Efficient'**
  String get timeEfficient;

  /// No description provided for @notTimeEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Time Efficient'**
  String get notTimeEfficient;

  /// No description provided for @laborEfficient.
  ///
  /// In en, this message translates to:
  /// **'Labor Efficient'**
  String get laborEfficient;

  /// No description provided for @notLaborEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Labor Efficient'**
  String get notLaborEfficient;

  /// No description provided for @resourceEfficient.
  ///
  /// In en, this message translates to:
  /// **'Resource Efficient'**
  String get resourceEfficient;

  /// No description provided for @notResourceEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Resource Efficient'**
  String get notResourceEfficient;

  /// No description provided for @energyEfficient.
  ///
  /// In en, this message translates to:
  /// **'Energy Efficient'**
  String get energyEfficient;

  /// No description provided for @notEnergyEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Energy Efficient'**
  String get notEnergyEfficient;

  /// No description provided for @waterEfficient.
  ///
  /// In en, this message translates to:
  /// **'Water Efficient'**
  String get waterEfficient;

  /// No description provided for @notWaterEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Water Efficient'**
  String get notWaterEfficient;

  /// No description provided for @fertilizerEfficient.
  ///
  /// In en, this message translates to:
  /// **'Fertilizer Efficient'**
  String get fertilizerEfficient;

  /// No description provided for @notFertilizerEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Fertilizer Efficient'**
  String get notFertilizerEfficient;

  /// No description provided for @pesticideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Pesticide Efficient'**
  String get pesticideEfficient;

  /// No description provided for @notPesticideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Pesticide Efficient'**
  String get notPesticideEfficient;

  /// No description provided for @herbicideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Herbicide Efficient'**
  String get herbicideEfficient;

  /// No description provided for @notHerbicideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Herbicide Efficient'**
  String get notHerbicideEfficient;

  /// No description provided for @fungicideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Fungicide Efficient'**
  String get fungicideEfficient;

  /// No description provided for @notFungicideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Fungicide Efficient'**
  String get notFungicideEfficient;

  /// No description provided for @bactericideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Bactericide Efficient'**
  String get bactericideEfficient;

  /// No description provided for @notBactericideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Bactericide Efficient'**
  String get notBactericideEfficient;

  /// No description provided for @nematicideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Nematicide Efficient'**
  String get nematicideEfficient;

  /// No description provided for @notNematicideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Nematicide Efficient'**
  String get notNematicideEfficient;

  /// No description provided for @acaricideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Acaricide Efficient'**
  String get acaricideEfficient;

  /// No description provided for @notAcaricideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Acaricide Efficient'**
  String get notAcaricideEfficient;

  /// No description provided for @rodenticideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Rodenticide Efficient'**
  String get rodenticideEfficient;

  /// No description provided for @notRodenticideEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Rodenticide Efficient'**
  String get notRodenticideEfficient;

  /// No description provided for @growthRegulatorEfficient.
  ///
  /// In en, this message translates to:
  /// **'Growth Regulator Efficient'**
  String get growthRegulatorEfficient;

  /// No description provided for @notGrowthRegulatorEfficient.
  ///
  /// In en, this message translates to:
  /// **'Not Growth Regulator Efficient'**
  String get notGrowthRegulatorEfficient;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
