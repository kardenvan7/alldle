import 'package:alldle/di/global_scope.dart';
import 'package:alldle/features/app/presentation/alldle.dart';
import 'package:flutter/material.dart';

void main() {
  AppInitializer().initialize();
}

class AppInitializer {
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await initDependencyInjection();

    runApp(const Alldle());
  }

  /// Initializes dependency injection classes for all scopes.
  ///
  Future<void> initDependencyInjection() async {
    await GlobalScope.instance.configure();
  }
}
