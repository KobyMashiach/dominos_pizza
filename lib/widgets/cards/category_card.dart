import 'package:dominos_pizza/core/text_styles.dart';
import 'package:dominos_pizza/core/translates/get_tran.dart';
import 'package:dominos_pizza/models/category/category_model.dart';
import 'package:dominos_pizza/models/product/product_model.dart';
import 'package:dominos_pizza/widgets/cards/product_card.dart';
import 'package:flutter/material.dart';
import 'package:kh_easy_dev/kh_easy_dev.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final double height;
  const CategoryCard({super.key, required this.category, required this.height});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          appTranslate(category.title),
          style: AppTextStyle().cardTitle,
        ),
        SizedBox(height: 12),
        SizedBox(
          height: height,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: category.productsLength,
            separatorBuilder: (context, index) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              final ProductModel product = category.products[index];
              return ProductCard(product: product, height: height);
            },
          ),
        ),
        SizedBox(height: 12),
        kheasydevDivider(black: true),
      ],
    );
  }
}
