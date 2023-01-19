import 'package:json_annotation/json_annotation.dart';
part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  final String id;
  final int quantity;

  ItemModel({required this.id, required this.quantity});

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
