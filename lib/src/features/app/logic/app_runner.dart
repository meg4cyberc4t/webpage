import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webpage/src/core/logger/logger.dart';
import 'package:webpage/src/features/app/widget/material_context.dart';

/// A class which is responsible for initialization and running the app.
final class AppRunner {
  /// Start the initialization and in case of success run application
  Future<void> initializeAndRun() async {
    final WidgetsBinding bindings = WidgetsFlutterBinding.ensureInitialized()
      ..deferFirstFrame();
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    FlutterError.onError = logger.logFlutterError;
    PlatformDispatcher.instance.onError = logger.logPlatformDispatcherError;
    bindings.allowFirstFrame();
    runZonedGuarded(
      () => runApp(const MaterialContext()),
      (final error, final stack) {
        logger.error('Top-error', error: error, stackTrace: stack);
      },
    );
  }
}
