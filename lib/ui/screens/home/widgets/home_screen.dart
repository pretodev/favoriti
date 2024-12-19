import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../shared/debouncer.dart';
import '../home_store.dart';
import 'product_filter_delegate.dart';
import 'product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.store,
  });

  final HomeStore store;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchQueryDebouncer = Debouncer('');
  final _searchQueryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.store.loadProducts();
    _searchQueryController.addListener(() {
      _searchQueryDebouncer.value = _searchQueryController.text;
    });
    _searchQueryDebouncer.addListener(() {
      widget.store.setQuery(_searchQueryDebouncer.value);
    });
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
              builder: (context) => ProductList(
                products: widget.store.filteredProducts,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
