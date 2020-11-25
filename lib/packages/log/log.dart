import 'dart:developer' as developer;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class Log {
  static Log _instance;
  static bool _logInDebugMode;
  static bool _logInReleaseMode;
  static bool _enableFirebaseCrashlyticsInDebug;
  static bool _enableFirebaseCrashlyticsInRelease;

  /// Initialize [Log] instance
  ///
  /// [logInDebugMode] Enable logging in debug mode ([kDebugMode]). Default value is true.
  /// [logInReleaseMode] Enable logging in release mode ([kReleaseMode]). Default value is false.
  /// [enableFirebaseCrashlyticsInDebug] Enable Firebase Crashlytics logging in debug mode ([kDebugMode]). Default value is false.
  /// [enableFirebaseCrashlyticsInRelease] Enable Firebase Crashlytics logging in release mode ([kReleaseMode]). Default value is false.
  static void init({
    bool logInDebugMode = true,
    bool logInReleaseMode = false,
    bool enableFirebaseCrashlyticsInDebug = false,
    bool enableFirebaseCrashlyticsInRelease = false,
  }) {
    _logInDebugMode = logInDebugMode;
    _logInReleaseMode = logInReleaseMode;
    _enableFirebaseCrashlyticsInDebug = enableFirebaseCrashlyticsInDebug;
    _enableFirebaseCrashlyticsInRelease = enableFirebaseCrashlyticsInRelease;

    _instance ??= Log();
  }

  static void _checkInstance() {
    assert(
      _instance != null,
      '\nEnsure to initialize Log before accessing it.\nPlease execute the init method : Log.init()',
    );
  }

  /// Logging information
  ///
  /// [tag] page name or class name of the event origins
  /// [msg] log message
  /// [references] more event references such as method name or function name for further identification
  static void i(String tag, String msg, {List<String> references}) {
    var name = "🤠 INFO: $tag" +
        (references != null || references.isNotEmpty
            ? ': ' + references?.join(' => ')
            : '');
    _log(name, msg);
  }

  /// Logging debug
  ///
  /// [tag] page name or class name of the event origins
  /// [msg] log message
  /// [references] more event references such as method name or function name for further identification
  static void d(String tag, String msg, {List<String> references}) async {
    var name = "🚧 DEBUG: $tag" +
        (references != null || references.isNotEmpty
            ? ': ' + references?.join(' => ')
            : '');
    _log(name, msg);
  }

  /// Logging warning
  ///
  /// [tag] page name or class name of the event origins
  /// [msg] log message
  /// [references] more event references such as method name or function name for further identification
  /// [exception] an exception detail
  /// [stackTrace] if available pass. This is important when you using firebase crashlytics trace back the error
  static void w(String tag, String msg,
      {List<String> references,
      dynamic exception,
      StackTrace stackTrace}) async {
    var name = "❗ WARN: $tag" +
        (references != null || references.isNotEmpty
            ? ': ' + references?.join(' => ')
            : '');
    _log(name, msg, exception: exception, stackTrace: stackTrace);
  }

  /// Logging an error
  ///
  /// [tag] page name or class name of the event origins
  /// [msg] log message
  /// [references] more event references such as method name or function name for further identification
  /// [exception] an exception detail
  /// [stackTrace] if available pass. This is important when you using firebase crashlytics trace back the error
  static void e(String tag, String msg,
      {List<String> references,
      dynamic exception,
      StackTrace stackTrace}) async {
    var name = "🚨 ERROR: $tag" +
        (references != null || references.isNotEmpty
            ? ': ' + references?.join(' => ')
            : '');
    _log(name, msg, exception: exception, stackTrace: stackTrace);
  }

  static void _log(String name, String msg,
      {dynamic exception, StackTrace stackTrace}) async {
    _checkInstance();

    if ((_logInDebugMode && kDebugMode) ||
        (_logInReleaseMode && kReleaseMode)) {
      developer.log(msg, name: name, error: exception, stackTrace: stackTrace);
    }

    if ((_enableFirebaseCrashlyticsInDebug && kDebugMode) ||
        (_enableFirebaseCrashlyticsInRelease && kReleaseMode)) {
      FirebaseCrashlytics.instance.log("$name => $msg");

      if (exception != null || stackTrace != null)
        await FirebaseCrashlytics.instance.recordError(exception, stackTrace);
    }
  }
}
