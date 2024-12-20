import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'configs/application.dart';
import 'configs/environment.dart';
import 'configs/firebase/firebase_boot.dart';
import 'configs/service_locator/service_locator.dart';
import 'core/domain/catalog/product_repository.dart';
import 'core/domain/favorite/favorite_repository.dart';
import 'data/repositories/catalog_repository_impl.dart';
import 'data/repositories/favorite_repository_impl.dart';
import 'data/services/api/api_client.dart';
import 'data/services/cache/cache_manager.dart';
import 'data/services/local/local_favorite_product_list.dart';
import 'ui/notifications/notificator.dart';
import 'ui/routing/routes.dart';
import 'ui/state/connectivity/connectivity_store.dart';
import 'ui/state/favorite_list/favorite_list_store.dart';
import 'ui/styles/styles.dart';

void main() async {
  buildApp(
    tasks: [
      FirebaseBoot(),
      ServiceLocatorBoot(
        bind: (i) {
          i.addInstance(Environment.initialize());

          // drivers
          i.addLazySingleton(Connectivity.new);

          // services
          i.addLazySingleton(ApiClient.new);
          i.addLazySingleton(CacheManager.new);
          i.addLazySingleton(LocalFavoriteProductList.new);

          // repositories
          i.addLazySingleton<CatalogRepository>(
            CatalogRepositoryImpl.new,
          );
          i.addLazySingleton<FavoriteRepository>(
            FavoriteRepositoryImpl.new,
          );

          // global stores
          i.addLazySingleton(FavoriteListStore.new);
          i.addLazySingleton(ConnectivityStore.new);
        },
      ),
    ],
    app: const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Favoriti',
      theme: Styles.theme,
      routerConfig: Routes.routerConfig,
      builder: Notificator.builder,
    );
  }
}
