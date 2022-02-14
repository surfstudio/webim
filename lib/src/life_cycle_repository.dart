import 'package:flutter/material.dart';

/// Репозиторий уведомлений жизненного цикла приложений
class LifeCycleRepository with WidgetsBindingObserver, ChangeNotifier {
  AppLifecycleState? _appState;

  AppLifecycleState? get state => _appState;
  void subscribe() {
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _appState = state;
    notifyListeners();
  }
}
