import 'dart:convert';

import '../../../../core/domain/commom/price.dart';
import '../../../../core/domain/commom/rating.dart';
import '../../../../core/domain/product/product.dart';
import '../../../converter.dart';

class LocalFavoriteProductConverters {
  final fromLocal = Converter<String, Product>(
    (product) {
      final map = json.decode(product);
      return Product(
        id: map['id'],
        title: map['title'],
        price: Price(map['price']),
        imageUrl: map['image'],
        category: map['category'],
        description: map['description'],
        rating: Rating(
          rate: (map['rating']['rate'] as num).toDouble(),
          count: map['rating']['count'],
        ),
      );
    },
  );

  final toLocal = Converter<Product, String>(
    (product) {
      final productMap = {
        'id': product.id,
        'title': product.title,
        'price': product.price.value,
        'image': product.imageUrl,
        'category': product.category,
        'description': product.description,
        'rating': {
          'rate': product.rating.rate,
          'count': product.rating.count,
        },
      };
      return json.encode(productMap);
    },
  );
}
