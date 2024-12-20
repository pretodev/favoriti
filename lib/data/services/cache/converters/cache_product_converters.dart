import 'dart:convert';

import '../../../../core/domain/commom/price.dart';
import '../../../../core/domain/commom/product.dart';
import '../../../../core/domain/commom/rating.dart';
import '../../../converter.dart';
import '../cached_data.dart';

class CacheProductConverters {
  final toCache = Converter<CachedData<Product>, String>((data) {
    final productMap = {
      'id': data.value.id,
      'title': data.value.title,
      'price': data.value.price.value,
      'category': data.value.category,
      'description': data.value.description,
      'image': data.value.imageUrl,
      'rating': {
        'rate': data.value.rating.rate,
        'count': data.value.rating.count,
      },
      'expireAt': data.expireAt.toIso8601String(),
    };
    return json.encode(productMap);
  });

  final fromCache = Converter<String, CachedData<Product>>((productJson) {
    final productMap = json.decode(productJson);
    final product = Product(
      id: productMap['id'],
      title: productMap['title'],
      price: Price(productMap['price']),
      category: productMap['category'],
      description: productMap['description'],
      imageUrl: productMap['image'],
      rating: Rating(
        rate: (productMap['rating']['rate'] as num).toDouble(),
        count: productMap['rating']['count'],
      ),
    );
    return CachedData(
      value: product,
      expireAt: DateTime.parse(productMap['expireAt']),
    );
  });
}
