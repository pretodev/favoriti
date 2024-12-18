import 'package:flutter/material.dart';

import 'configs/application.dart';
import 'configs/environment.dart';
import 'configs/firebase/firebase_boot.dart';
import 'configs/service_locator/service_locator.dart';
import 'core/domain/product/product_repository.dart';
import 'data/repositories/product_repository.dart';
import 'data/services/api/api_client.dart';
import 'ui/screens/home/home_store.dart';
import 'ui/screens/home/widgets/home_screen.dart';
import 'ui/styles/styles.dart';

void main() async {
  buildApp(
    tasks: [
      FirebaseBoot(),
      ServiceLocatorBoot(
        bind: (i) {
          i.addInstance(Environment.initialize());

          // services
          i.addLazySingleton(ApiClient.new);

          // repositories
          i.addLazySingleton<ProductRepository>(StoreProductRepository.new);
        },
      ),
    ],
    builder: () => const MainApp(),
  );
}

class MainApp extends StatelessWidget with ServiceLocatorMixin {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bemol App',
      theme: Styles.theme,
      home: HomeScreen(
        store: HomeStore(productRepository: instance()),
      ),
    );
  }
}
