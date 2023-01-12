import 'package:json_annotation/json_annotation.dart';
part 'donut_model.g.dart';

enum DonutCategory {
  @JsonValue('donut')
  donut,
  @JsonValue('cake')
  cake,
  @JsonValue('bake')
  bake,
}

extension DonutCategoryExtension on DonutCategory {
  String get name {
    switch (this) {
      case DonutCategory.donut:
        return '도넛';
      case DonutCategory.cake:
        return '케이크';
      case DonutCategory.bake:
        return '베이킹';
    }
  }
}

@JsonSerializable()
class DonutModel {
  @JsonKey(fromJson: convertInt)
  final int id;
  final String img;
  final String title;
  final String subTitle;
  @JsonKey(fromJson: convertInt)
  final int price;
  final String description;
  final DonutCategory category;
  DonutModel(
      {required this.id,
      required this.img,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.description,
      required this.category});

  static int convertInt(String str) => int.tryParse(str) ?? 0;

  factory DonutModel.fromJson(Map<String, dynamic> json) =>
      _$DonutModelFromJson(json);
  Map<String, dynamic> toJson() => _$DonutModelToJson(this);
}
