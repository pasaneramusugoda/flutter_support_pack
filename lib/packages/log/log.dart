import 'dart:developer' as developer;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class Log {
  static Log _instance;
  static bool _logInDebugMode;
  static bool _logInReleaseMode;
  static bool _enableFirebaseCrashlyticsInDebug;
  static bool _enableFirebaseCrashlyticsInRelease;

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

  static void i(String tag, String msg, {List<String> references}) {
    var name = "🤠 INFO: $tag" +
        (references != null || references.isNotEmpty
            ? ': ' + references?.join(' => ')
            : '');
    _log(name, msg);
  }

  static void d(String tag, String msg, {List<String> references}) async {
    var name = "🚧 DEBUG: $tag" +
        (references != null || references.isNotEmpty
            ? ': ' + references?.join(' => ')
            : '');
    _log(name, msg);
  }

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
