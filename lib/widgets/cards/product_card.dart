import 'package:dominos_pizza/core/text_styles.dart';
import 'package:dominos_pizza/models/product/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final double height;
  const ProductCard({super.key, required this.product, required this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: height,
            width: height,
            child: Image.network(
              product.images.first,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          bottom: 0,
          child: Container(
            height: 0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                colors: [
                  Colors.white.withOpacity(0.8),
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.0)
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Text(
            product.name,
            textAlign: TextAlign.center,
            style: AppTextStyle().cardTitle.copyWith(
              fontSize: 12,
              shadows: [
                Shadow(
                  color: Colors.white,
                  blurRadius: 3,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
