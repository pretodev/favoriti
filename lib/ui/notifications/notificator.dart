import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../configs/service_locator/service_locator.dart';
import '../state/favorite_list/favorite_list_store.dart';

class Notificator extends StatelessWidget with ServiceLocatorMixin {
  static Widget builder(BuildContext context, Widget? child) {
    return Notificator(child: child ?? SizedBox());
  }

  const Notificator({super.key, required this.child});

  final Widget child;

  void _showMessage(ScaffoldMessengerState messenger, String message) {
    messenger //
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) {
        final favoriteListStore = instance<FavoriteListStore>();
        return reaction((_) => favoriteListStore.status, (state) {
          final messenger = ScaffoldMessenger.of(context);
          if (state == FavoriteListStatuses.error) {
            _showMessage(messenger, favoriteListStore.errorMessage);
          }
          if (state == FavoriteListStatuses.added) {
            _showMessage(messenger, 'Product added to favorites');
          }
          if (state == FavoriteListStatuses.removed) {
            _showMessage(messenger, 'Product removed from favorites');
          }
        });
      },
      child: child,
    );
  }
}
