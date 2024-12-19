import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../configs/service_locator/service_locator.dart';
import 'screens/home/widgets/home_screen.dart';
import 'screens/product_details/widgets/product_details_screen.dart';

final class Routes with ServiceLocatorMixin {
  static const _products = 'products';

  static const home = '/';
  static const products = '/$_products';
  static String productDetails(int id) => '/$_products/$id';

  static GoRouter get routerConfig => Routes._()._router;

  static final _navigatorKey = GlobalKey<NavigatorState>();

  Routes._();

  GoRouter get _router {
    return GoRouter(
      initialLocation: home,
      debugLogDiagnostics: true,
      navigatorKey: _navigatorKey,
      routes: [
        GoRoute(
          path: home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '$products/:id',
          builder: (context, state) {
            final id = int.parse(state.pathParameters['id']!);
            return ProductDetailsScreen(productId: id);
          },
        ),
      ],
    );
  }
}
