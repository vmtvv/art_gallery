import 'package:logger/logger.dart';

class AppLogger {
  final _internalLogger = Logger(
    level: Level.debug,
    printer: PrettyPrinter(
      printEmojis: false,
      methodCount: 0,
      printTime: false,
    ),
  );

  /// Log a message at level [Level.verbose].
  void v(String Function() message) {
    _logInternally(Level.verbose, message);
  }

  /// Log a message at level [Level.debug].
  void d(String Function() message) {
    _logInternally(Level.debug, message);
  }

  /// Log a message at level [Level.info].
  void i(String Function() message) {
    _logInternally(Level.info, message);
  }

  /// Log a message at level [Level.warning].
  void w(String Function() message) {
    _logInternally(Level.warning, message);
  }

  /// Log a message at level [Level.error].
  void e(String Function() message, [dynamic error, StackTrace? stackTrace]) {
    _logInternally(Level.error, message, error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  void wtf(String Function() message) {
    _logInternally(Level.wtf, message);
  }

  void _logInternally(Level level, String Function() message,
      [dynamic error, StackTrace? stackTrace]) {
    _internalLogger.log(level, message, error, stackTrace);
  }
}
