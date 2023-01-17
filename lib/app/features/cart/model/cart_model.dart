// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:knotted_donut_tdd/app/features/store/model/store_model.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final Map<String, int> items;
  final StoreModel store;
  CartModel(this.items, this.store);

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);

  CartModel copyWith({
    Map<String, int>? items,
    StoreModel? store,
  }) {
    return CartModel(
      items ?? this.items,
      store ?? this.store,
    );
  }
}
