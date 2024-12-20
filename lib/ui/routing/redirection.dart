import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

import '../../configs/service_locator/service_locator.dart';
import '../state/connectivity/connectivity_store.dart';
import 'routes.dart';

class Redirection extends ChangeNotifier with ServiceLocatorMixin {
  Redirection() {
    _connectivity();
  }

  final List<ReactionDisposer> _disposers = [];

  void _connectivity() {
    final store = instance<ConnectivityStore>();
    final disposer = when(
      (_) => store.status != ConnectivityStatuses.waiting,
      notifyListeners,
    );
    _disposers.add(disposer);
  }

  String? redirect(BuildContext context, GoRouterState state) {
    final connectivity = instance<ConnectivityStore>();
    if (connectivity.status == ConnectivityStatuses.disconnected) {
      return Routes.failuresConnectivity;
    }

    final bool isSplash = state.matchedLocation == '/';
    if (isSplash && connectivity.status == ConnectivityStatuses.connected) {
      return Routes.products;
    }

    return null;
  }

  @override
  void dispose() {
    for (var disposer in _disposers) {
      disposer();
    }
    _disposers.clear();
    super.dispose();
  }
}
