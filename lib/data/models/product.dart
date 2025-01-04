// lib/data/models/product.dart

import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });
}

List<Product> demoProducts = [
  Product(
    id: 1,
    images: ["https://i.postimg.cc/c19zpJ6f/Image-Popular-Product-1.png"],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DBF),
      const Color(0xFFDECB9C),
    ],
    title: "Wireless Controller for PS4",
    price: 64.99,
    description: "Wireless Controller for PS4 with high-quality build.",
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  // Add more products as needed
];
