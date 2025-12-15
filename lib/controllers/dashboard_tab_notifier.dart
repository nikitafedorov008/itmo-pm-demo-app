import 'package:flutter/material.dart';

class DashboardTabNotifier extends StatefulWidget {
  final Widget child;
  
  const DashboardTabNotifier({
    super.key,
    required this.child,
  });

  static _DashboardTabScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_DashboardTabInherited>()?._scope;
  }

  @override
  State<DashboardTabNotifier> createState() => _DashboardTabNotifierState();
}

class _DashboardTabNotifierState extends State<DashboardTabNotifier> {
  int _currentIndex = 0;
  
  int get currentIndex => _currentIndex;
  
  void changeTab(int newIndex) {
    if (newIndex >= 0 && newIndex < 4) { // 4 is the number of tabs in main dashboard
      setState(() {
        _currentIndex = newIndex;
      });
    }
  }
  
  void goToFieldTab() {
    changeTab(2); // FieldDetailsScreen is at index 2 in main dashboard
  }

  @override
  Widget build(BuildContext context) {
    return _DashboardTabInherited(
      scope: _DashboardTabScope(
        currentIndex: _currentIndex,
        changeTab: changeTab,
        goToFieldTab: goToFieldTab,
      ),
      child: widget.child,
    );
  }
}

class _DashboardTabInherited extends InheritedWidget {
  final _DashboardTabScope _scope;

  const _DashboardTabInherited({
    super.key,
    required super.child,
    required _DashboardTabScope scope,
  }) : _scope = scope;

  @override
  bool updateShouldNotify(_DashboardTabInherited oldWidget) {
    return oldWidget._scope.currentIndex != _scope.currentIndex;
  }
}

class _DashboardTabScope {
  final int currentIndex;
  final void Function(int) changeTab;
  final void Function() goToFieldTab;

  const _DashboardTabScope({
    required this.currentIndex,
    required this.changeTab,
    required this.goToFieldTab,
  });
}