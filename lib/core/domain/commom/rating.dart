import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Rating extends Equatable {
  final int count;
  final double rate;

  const Rating({
    required this.rate,
    required this.count,
  });

  @override
  final stringify = true;

  @override
  List<Object?> get props => [rate, count];
}
