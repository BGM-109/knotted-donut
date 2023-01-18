import 'package:json_annotation/json_annotation.dart';
part 'store_model.g.dart';

@JsonSerializable()
class StoreModel {
  final String img;
  final String name;
  final String address;
  @JsonKey(fromJson: parseLocation)
  final double lat;
  @JsonKey(fromJson: parseLocation)
  final double long;

  StoreModel(this.img, this.name, this.address, this.lat, this.long);

  static parseLocation(String location) => double.parse(location);

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
  Map<String, dynamic> toJson() => _$StoreModelToJson(this);
}
