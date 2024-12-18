import '../../../../core/domain/product/product.dart';
import '../../../../core/domain/product/rating.dart';
import '../../../mapper.dart';

class ApiProductMapper implements Mapper<dynamic, Product> {
  @override
  Product map(json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
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
