import 'package:auto_injector/auto_injector.dart';
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
