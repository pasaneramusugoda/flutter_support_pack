# flutter_support_pack

[![pub package](https://img.shields.io/pub/v/flutter_support_pack.svg)](https://pub.dartlang.org/packages/flutter_support_pack)

Commanly used features in on package to reduce number of imports and dependancy issues

## Usage

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  flutter_support_pack: ^0.0.1
```

In your library add the following import:

```dart
import 'package:flutter_support_pack/flutter_support_pack.dart';
```

## Packages (more to come)

## Log

Log api provide you the easy way to log your info, debug, warn and error logs. Also capable of log to flutter crashlytics.

### Property

|Property|Type|Default Value|Description|
|:---|:---|:---|:---|
|logInDebugMode|bool|true|Enable loggin in debug mode (kDebugMode)|
|logInReleaseMode|bool|false|Enable loggin in release mode (kReleaseMode)|
|enableFirebaseCrashlyticsInDebug|bool|false|Enable Firebase Crashlytics logging in debug mode (kDebugMode). If enabled you may initialize Firebase before Log.init()|
|enableFirebaseCrashlyticsInRelease|bool|false|Enable Firebase Crashlytics logging in release mode (kReleaseMode). If enabled you may initialize Firebase before Log.init()|

### Initialize
You may initialize in the main function

```

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase app if only using Firebase Crashlytics
  // await Firebase.initializeApp();

  // Initialize Log
  Log.init(
        logInDebugMode: true,
        logInReleaseMode: false,
        enableFirebaseCrashlyticsInDebug: false,
        enableFirebaseCrashlyticsInRelease: false);

  runApp(MyApp());
}

```

### Example Usage

You can use references parameter to mention any extra debug information to easily recodnice in log

```

Log.i(TAG, 'initialized', references: ['initState']);
Log.d(TAG, '$_counter', references: ['_incrementCounter', 'begin']);
Log.w(TAG, 'about to hit the level => $_counter', references: ['_incrementCounter']);
Log.e(TAG, '$_counter', references: ['_incrementCounter'], exception: e);

```

