import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:result_dart/result_dart.dart';

Future<void> buildApp({
  List<AppBootTask> tasks = const [],
  required Widget app,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  for (final task in tasks) {
    final result = await task.prepare();
    if (result.isError()) {
      throw result.exceptionOrNull()!;
    }
  }

  runApp(app);
}

abstract interface class AppBootTask {
  AsyncResult<Unit> prepare();
}
