import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';

import '../../../../configs/service_locator/service_locator.dart';
import '../../../../core/domain/product/product.dart';
import '../../../../shared/debouncer.dart';
import '../../../routes.dart';
import '../home_store.dart';
import 'product_filter_delegate.dart';
import 'product_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with StoreMixin<HomeStore> {
  final _searchQueryDebouncer = Debouncer('');
  final _searchQueryController = TextEditingController();

  late final _store = store(HomeStore.new);

  void _showProduct(Product product) {
    context.push(Routes.productDetails(product.id), extra: product);
  }

  @override
  void initState() {
    super.initState();
    _store.loadProducts();
    _searchQueryController.addListener(() {
      _searchQueryDebouncer.value = _searchQueryController.text;
    });
    _searchQueryDebouncer.addListener(() {
      _store.setQuery(_searchQueryDebouncer.value);
    });
  }

  @override
  void dispose() {
    _searchQueryController.dispose();
    _searchQueryDebouncer.dispose();
    storeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Products'),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: ProductFilterDelegate(
                controller: _searchQueryController,
              ),
            ),
            Observer(
              builder: (context) {
                final products = _store.filteredProducts;
                return SliverList.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductListItem(
                      product: product,
                      onClicked: () => _showProduct(product),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
