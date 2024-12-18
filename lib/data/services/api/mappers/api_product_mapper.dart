import '../../../../core/domain/product/price.dart';
import '../../../../core/domain/product/product.dart';
import '../../../../core/domain/product/rating.dart';
import '../../../mapper.dart';

class ApiProductMapper implements Mapper<dynamic, Product> {
  @override
  Product map(json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: Price(json['price']),
      category: json['category'],
      description: json['description'],
      imageUrl: json['image'],
      rating: Rating(
        rate: (json['rating']['rate'] as num).toDouble(),
        count: json['rating']['count'],
      ),
    );
  }
}
