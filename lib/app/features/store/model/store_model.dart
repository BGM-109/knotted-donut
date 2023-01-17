import 'package:json_annotation/json_annotation.dart';
part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
  final String id;
  final String name;
  final String address;
  final num lat;
  final num long;

  StoreModel(this.id, this.name, this.address, this.lat, this.long);

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}
