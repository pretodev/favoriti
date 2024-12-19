import 'package:auto_injector/auto_injector.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:result_dart/result_dart.dart';

import '../application.dart';

final _injector = AutoInjector();

typedef Bind = void Function(AutoInjector injector)?;

class ServiceLocatorBoot implements AppBootTask {
  final Bind? bind;

  ServiceLocatorBoot({this.bind});

  @override
  AsyncResult<Unit> prepare() async {
    bind?.call(_injector);
    _injector.commit();
    return Success(unit);
  }
}

mixin ServiceLocatorMixin on Object {
  T instance<T>({Param? Function(Param)? transform, String? key}) {
    return _injector.get<T>(transform: transform, key: key);
  }
}

mixin StoreLocatorMixin<S extends Store, T extends StatefulWidget> on State<T> {
  AutoInjector? _storeInjector;

  S store(Function constructor, {String? tag}) {
    _storeInjector ??= AutoInjector(
      tag: tag ?? constructor.toString(),
      on: (i) {
        i.addInjector(_injector);
        i.addLazySingleton(constructor);
        i.commit();
      },
    );
    return _storeInjector!.get<S>();
  }

  @override
  void dispose() {
    _storeInjector?.dispose();
    super.dispose();
  }
}
