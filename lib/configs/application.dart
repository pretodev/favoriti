import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:result_dart/result_dart.dart';

typedef AppBuilder = FutureOr<Widget> Function();

Future<void> buildApp({
  List<AppBootTask> tasks = const [],
  required AppBuilder builder,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  for (final task in tasks) {
    final result = await task.prepare();
    if (result.isError()) {
      throw result.exceptionOrNull()!;
    }
  }

  final app = await builder();
  runApp(app);
}

abstract interface class AppBootTask {
  AsyncResult<Unit> prepare();
}
