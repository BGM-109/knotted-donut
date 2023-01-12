// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donut_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DonutModel _$DonutModelFromJson(Map<String, dynamic> json) => DonutModel(
      id: DonutModel.convertInt(json['id'] as String),
      img: json['img'] as String,
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      price: DonutModel.convertInt(json['price'] as String),
      description: json['description'] as String,
      category: $enumDecode(_$DonutCategoryEnumMap, json['category']),
    );

Map<String, dynamic> _$DonutModelToJson(DonutModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'img': instance.img,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'price': instance.price,
      'description': instance.description,
      'category': _$DonutCategoryEnumMap[instance.category]!,
    };

const _$DonutCategoryEnumMap = {
  DonutCategory.donut: 'donut',
  DonutCategory.cake: 'cake',
  DonutCategory.bake: 'bake',
};
