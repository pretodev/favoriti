import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../configs/service_locator/service_locator.dart';
import '../../../state/favorite_list/widgets/favorite_product_button.dart';
import '../product_details_store.dart';
import 'product_details_body.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with StoreMixin<ProductDetailsStore> {
  late final _store = store(ProductDetailsStore.new);

  @override
  void initState() {
    super.initState();
    _store.loadProduct(widget.productId);
  }

  @override
  void dispose() {
    storeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          Observer(
            builder: (context) {
              if (_store.product == null) {
                return const SizedBox();
              }
              return FavoriteProductButton(product: _store.product!);
            },
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          if (_store.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: ProductDetailsBody(product: _store.product!),
          );
        },
      ),
    );
  }
}
