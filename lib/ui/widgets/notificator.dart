import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../configs/service_locator/service_locator.dart';
import '../state/favorite_list_store.dart';

class Notificator extends StatefulWidget {
  const Notificator({super.key, required this.child});

  final Widget child;

  @override
  State<Notificator> createState() => _NotificatorState();
}

class _NotificatorState extends State<Notificator> with ServiceLocatorMixin {
  late final _favoriteListStore = instance<FavoriteListStore>();

  late final messenger = ScaffoldMessenger.of(context);

  void _showMessage(String message) {
    messenger //
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void initState() {
    super.initState();
    reaction((_) => _favoriteListStore.state, (state) {
      if (state == FavoriteListStoreState.error) {
        _showMessage(_favoriteListStore.errorMessage);
      }
      if (state == FavoriteListStoreState.added) {
        _showMessage('Product added to favorites');
      }
      if (state == FavoriteListStoreState.removed) {
        _showMessage('Product removed from favorites');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
