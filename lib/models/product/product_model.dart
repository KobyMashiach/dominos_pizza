import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

//extends HiveObject
// @HiveType(typeId: 100)

@freezed
class ProductModel with _$ProductModel {
  static const String hiveKey = 'ProductModel';
  @HiveType(typeId: 102, adapterName: 'ProductModelAdapter')
  factory ProductModel({
    @HiveField(0) required String name,
    @HiveField(1) required String description,
    @HiveField(2) required String category,
    @HiveField(3) required List<String> images,
    @HiveField(4) required double price,
    @HiveField(5) double? discountPrice,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
