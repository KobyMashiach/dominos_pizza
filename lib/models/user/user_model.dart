import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

//extends HiveObject
// @HiveType(typeId: 100)

@freezed
class UserModel with _$UserModel {
  static const String hiveKey = 'UserModel';
  @HiveType(typeId: 100, adapterName: 'UserModelAdapter')
  factory UserModel({
    @HiveField(0) required String userName,
    @HiveField(1) required String phoneNumber,
    @HiveField(2) required String name,
    @HiveField(3) required String email,
    @HiveField(4) required String password,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
