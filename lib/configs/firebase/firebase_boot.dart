import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:result_dart/result_dart.dart';

import '../../firebase_options.dart';
import '../application.dart';

class FirebaseBoot implements AppBootTask {
  @override
  AsyncResult<Unit> prepare() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // crashlytics setup
    FlutterError.onError = (details) {
      if (kReleaseMode) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      } else {
        log(details.exceptionAsString(), stackTrace: details.stack);
      }
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      if (kReleaseMode) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      } else {
        log(error.toString(), stackTrace: stack);
      }
      return true;
    };

    return Success(unit);
  }
}
