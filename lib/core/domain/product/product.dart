import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'price.dart';
import 'rating.dart';

@immutable
class Product extends Equatable {
  final int id;
  final String title;
  final Price price;
  final String category;
  final String description;
  final String imageUrl;
  final Rating rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });

  @override
  final stringify = true;

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        category,
        description,
        imageUrl,
        rating,
      ];
}
