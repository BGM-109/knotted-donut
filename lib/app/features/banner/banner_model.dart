import 'package:json_annotation/json_annotation.dart';
part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {
  final String img;
  final String link;

  BannerModel(this.img, this.link);

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}
