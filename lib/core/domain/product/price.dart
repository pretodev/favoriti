import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Price extends Equatable {
  final num value;

  Price(this.value) {
    if (value < 0) {
      throw ArgumentError('Price cannot be negative');
    }
  }

  @override
  List<Object?> get props => [value];

  @override
  bool? get stringify => true;

  String get asCurrency => NumberFormat.currency(
        locale: 'en_US',
        symbol: '\$',
      ).format(value.toDouble());
}
