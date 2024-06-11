import 'package:dominos_pizza/models/product/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

//extends HiveObject
// @HiveType(typeId: 100)

@freezed
class CategoryModel with _$CategoryModel {
  static const String hiveKey = 'CategoryModel';
  @HiveType(typeId: 101, adapterName: 'CategoryModelAdapter')
  factory CategoryModel({
    @HiveField(0) required String title,
    @HiveField(1) required String description,
    @HiveField(2) required String imageUrl,
    @HiveField(3) required int productsLength,
    @HiveField(4) required List<ProductModel> products,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
