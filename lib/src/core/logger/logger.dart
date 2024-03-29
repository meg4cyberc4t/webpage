import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart' as logging;

/// Logger instance
final Logger logger = AppLogger$Logging();

/// Possible levels of logging
enum LoggerLevel implements Comparable<LoggerLevel> {
  /// Error level
  error._(1000),

  /// Warning level
  warning._(800),

  /// Info level
  info._(600),

  /// Debug level
  debug._(400),

  /// Verbose level
  verbose._(200);

  const LoggerLevel._(this.value);

  /// Value of the level
  final int value;

  @override
  int compareTo(final LoggerLevel other) => value.compareTo(other.value);

  @override
  String toString() => '$LoggerLevel($value)';
}

/// Options for the logger
base class LogOptions {
  const LogOptions({
    this.showTime = true,
    this.showEmoji = true,
    this.logInRelease = false,
    this.level = LoggerLevel.info,
    this.formatter,
  });

  /// Log level
  final LoggerLevel level;

  /// Whether to show time
  final bool showTime;

  /// Whether to show emoji
  final bool showEmoji;

  /// Whether to log in release mode
  final bool logInRelease;

  /// Formatter for the log message
  final String Function({
    required String message,
    required StackTrace? stackTrace,
    required DateTime? time,
  })? formatter;
}

/// Log message
base class LogMessage {
  const LogMessage({
    required this.message,
    required this.logLevel,
    this.stackTrace,
    this.time,
  });

  /// Log message
  final String message;

  /// Stack trace
  final StackTrace? stackTrace;

  /// Time of the log
  final DateTime? time;

  /// Log level
  final LoggerLevel logLevel;
}

/// Logger interface
abstract base class Logger {
  /// Logs the error to the console
  void error(
    final Object message, {
    final Object? error,
    final StackTrace? stackTrace,
  });

  /// Logs the warning to the console
  void warning(final Object message);

  /// Logs the info to the console
  void info(final Object message);

  /// Logs the debug to the console
  void debug(final Object message);

  /// Logs the verbose to the console
  void verbose(final Object message);

  /// Set up the logger
  L runLogging<L>(
    final L Function() fn, [
    final LogOptions options = const LogOptions(),
  ]);

  /// Stream of logs
  Stream<LogMessage> get logs;

  /// Handy method to log zoneError
  void logZoneError(final Object error, final StackTrace stackTrace) {
    this.error('Top-level error', error: error, stackTrace: stackTrace);
  }

  /// Handy method to log [FlutterError]
  void logFlutterError(final FlutterErrorDetails details) {
    error(details.exceptionAsString(), stackTrace: details.stack);
  }

  /// Handy method to log [PlatformDispatcher] error
  bool logPlatformDispatcherError(
    final Object error,
    final StackTrace stackTrace,
  ) {
    this.error(error, stackTrace: stackTrace);
    return true;
  }
}

/// Default logger using logging package
final class AppLogger$Logging extends Logger {
  final logging.Logger _logger = logging.Logger('ApplicationLogger');

  @override
  void debug(final Object message) => _logger.fine(message);

  @override
  void error(
    final Object message, {
    final Object? error,
    final StackTrace? stackTrace,
  }) =>
      _logger.severe(
        message,
        error,
        stackTrace,
      );

  @override
  void info(final Object message) => _logger.info(message);

  @override
  Stream<LogMessage> get logs => _logger.onRecord.map(
        (final record) => LogMessage(
          message: record.message,
          stackTrace: record.stackTrace,
          time: record.time,
          logLevel: switch (record.level) {
            logging.Level.SEVERE => LoggerLevel.error,
            logging.Level.WARNING => LoggerLevel.warning,
            logging.Level.INFO => LoggerLevel.info,
            logging.Level.FINE || logging.Level.FINER => LoggerLevel.debug,
            _ => LoggerLevel.verbose,
          },
        ),
      );

  @override
  L runLogging<L>(
    final L Function() fn, [
    final LogOptions options = const LogOptions(),
  ]) {
    if (kReleaseMode && !options.logInRelease) {
      return fn();
    }
    logging.hierarchicalLoggingEnabled = true;

    _logger.onRecord
        .where(
      (final event) => event.loggerName == 'ApplicationLogger',
    )
        .listen((final event) {
      final String message = options.formatter?.call(
            message: event.message,
            stackTrace: event.stackTrace,
            time: event.time,
          ) ??
          _formatLoggerMessage(
            message: event.message,
            logLevel: event.level,
            time: event.time,
            error: event.error,
          );

      final LoggerLevel logLevel = switch (event.level) {
        logging.Level.SEVERE => LoggerLevel.error,
        logging.Level.WARNING => LoggerLevel.warning,
        logging.Level.INFO => LoggerLevel.info,
        logging.Level.FINE || logging.Level.FINER => LoggerLevel.debug,
        _ => LoggerLevel.verbose,
      };

      if (logLevel.compareTo(options.level) < 0) {
        return;
      }

      debugPrint(message);
      if (logLevel.value > logging.Level.INFO.value) {
        debugPrintStack(stackTrace: event.stackTrace);
      }
    });

    return fn();
  }

  /// Formats the logger message
  ///
  /// Combines emoji, time and message
  static String _formatLoggerMessage({
    required final Object message,
    required final logging.Level logLevel,
    required final DateTime time,
    final Object? error,
  }) =>
      '${logLevel.emoji} ${time.formatTime()}'
      ' | $message ${error != null ? '| $error' : ''}';

  @override
  void verbose(final Object message) => _logger.finest(message);

  @override
  void warning(final Object message) => _logger.warning(message);
}

extension on DateTime {
  /// Transforms DateTime to String with format: 00:00:00
  String formatTime() => <int>[hour, minute, second]
      .map((final i) => i.toString().padLeft(2, '0'))
      .join(':');
}

extension on logging.Level {
  /// Emoji for each log level
  String get emoji => switch (this) {
        logging.Level.SHOUT => '❗️',
        logging.Level.SEVERE => '🚫',
        logging.Level.WARNING => '⚠️',
        logging.Level.INFO => '💡',
        logging.Level.CONFIG => '🐞',
        logging.Level.FINE => '📌',
        logging.Level.FINER => '📌📌',
        logging.Level.FINEST => '📌📌📌',
        logging.Level.ALL => '',
        _ => '',
      };
}
