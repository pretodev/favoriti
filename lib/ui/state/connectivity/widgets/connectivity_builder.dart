import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../configs/service_locator/service_locator.dart';
import '../connectivity_store.dart';

class ConnectivityBuilder extends StatelessWidget with ServiceLocatorMixin {
  const ConnectivityBuilder({
    super.key,
    required this.builder,
    this.child,
  });

  final Widget Function(
    BuildContext context,
    ConnectivityStatuses status,
    Widget? child,
  ) builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final store = instance<ConnectivityStore>();
        return builder(context, store.status, child);
      },
    );
  }
}
