import 'package:flutter/foundation.dart';

class DashboardTabController extends ChangeNotifier {
  int _currentIndex = 0;
  
  int get currentIndex => _currentIndex;
  
  void changeTab(int newIndex) {
    if (newIndex >= 0 && newIndex < 4) { // 4 is the number of tabs in main dashboard
      _currentIndex = newIndex;
      notifyListeners();
    }
  }
  
  void goToFieldTab() {
    changeTab(2); // FieldDetailsScreen is at index 2 in main dashboard
  }
}