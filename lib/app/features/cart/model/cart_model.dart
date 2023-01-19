// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final Map<String, int> items;
  final String storeName;

  CartModel({required this.items, required this.storeName});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  CartModel copyWith({
    Map<String, int>? items,
    String? storeName,
  }) {
    return CartModel(
      items: items ?? this.items,
      storeName: storeName ?? this.storeName,
    );
  }
}
