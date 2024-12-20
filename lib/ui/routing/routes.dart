import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../screens/failures/widgets/connection_failure_screen.dart';
import '../screens/favorite/widgets/favorites_screen.dart';
import '../screens/home/widgets/home_screen.dart';
import '../screens/product_details/widgets/product_details_screen.dart';
import 'redirection.dart';

final class Routes {
  static const _products = 'products';
  static const _favorites = 'favorites';
  static const _failures = 'failures';

  static const splash = '/';
  static const products = '/$_products';
  static String productDetails(int id) => '/$_products/$id';
  static const favorites = '/$_favorites';
  static const failuresConnectivity = '/$_failures/connectivity';

  static GoRouter get routerConfig => Routes._()._router;

  static final _navigatorKey = GlobalKey<NavigatorState>();

  Routes._();

  GoRouter get _router {
    final redirection = Redirection();
    return GoRouter(
      initialLocation: splash,
      debugLogDiagnostics: true,
      navigatorKey: _navigatorKey,
      routes: [
        GoRoute(
          path: splash,
          builder: (context, state) => const SizedBox(),
        ),
        GoRoute(
          path: products,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '$products/:id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return ProductDetailsScreen(productId: id);
          },
        ),
        GoRoute(
          path: favorites,
          builder: (context, state) => const FavoritesScreen(),
        ),
        GoRoute(
          path: failuresConnectivity,
          builder: (context, state) => const ConnectionFailureScreen(),
        ),
      ],
      refreshListenable: redirection,
      redirect: redirection.redirect,
    );
  }
}
