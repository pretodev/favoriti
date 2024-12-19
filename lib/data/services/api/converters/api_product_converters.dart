import '../../../../core/domain/product/price.dart';
import '../../../../core/domain/product/product.dart';
import '../../../../core/domain/product/rating.dart';
import '../../../converter.dart';

class ApiProductConverters {
  final fromMap = Converter<dynamic, Product>(
    (map) {
      return Product(
        id: map['id'],
        title: map['title'],
        price: Price(map['price']),
        category: map['category'],
        description: map['description'],
        imageUrl: map['image'],
        rating: Rating(
          rate: (map['rating']['rate'] as num).toDouble(),
          count: map['rating']['count'],
        ),
      );
    },
  );
}
