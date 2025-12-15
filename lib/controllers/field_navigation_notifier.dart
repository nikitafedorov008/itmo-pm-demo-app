import 'package:flutter/material.dart';

class FieldNavigationNotifier extends StatefulWidget {
  final Widget child;

  const FieldNavigationNotifier({
    super.key,
    required this.child,
  });

  static _FieldNavigationScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_FieldNavigationInherited>()?._scope;
  }

  @override
  State<FieldNavigationNotifier> createState() => _FieldNavigationNotifierState();
}

class _FieldNavigationNotifierState extends State<FieldNavigationNotifier> {
  bool _fieldDetailsVisible = false;

  bool get fieldDetailsVisible => _fieldDetailsVisible;

  void showFieldDetails() {
    setState(() {
      _fieldDetailsVisible = true;
    });
  }

  void hideFieldDetails() {
    setState(() {
      _fieldDetailsVisible = false;
    });
  }

  void toggleFieldDetails() {
    setState(() {
      _fieldDetailsVisible = !_fieldDetailsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _FieldNavigationInherited(
      scope: _FieldNavigationScope(
        fieldDetailsVisible: _fieldDetailsVisible,
        showFieldDetails: showFieldDetails,
        hideFieldDetails: hideFieldDetails,
        toggleFieldDetails: toggleFieldDetails,
      ),
      child: widget.child,
    );
  }
}

class _FieldNavigationInherited extends InheritedWidget {
  final _FieldNavigationScope _scope;

  const _FieldNavigationInherited({
    super.key,
    required super.child,
    required _FieldNavigationScope scope,
  }) : _scope = scope;

  @override
  bool updateShouldNotify(_FieldNavigationInherited oldWidget) {
    return oldWidget._scope.fieldDetailsVisible != _scope.fieldDetailsVisible;
  }
}

class _FieldNavigationScope {
  final bool fieldDetailsVisible;
  final void Function() showFieldDetails;
  final void Function() hideFieldDetails;
  final void Function() toggleFieldDetails;

  const _FieldNavigationScope({
    required this.fieldDetailsVisible,
    required this.showFieldDetails,
    required this.hideFieldDetails,
    required this.toggleFieldDetails,
  });
}