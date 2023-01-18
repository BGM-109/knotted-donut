// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) => StoreModel(
      json['img'] as String,
      json['name'] as String,
      json['address'] as String,
      StoreModel.parseLocation(json['lat'] as String),
      StoreModel.parseLocation(json['long'] as String),
    );

Map<String, dynamic> _$StoreModelToJson(StoreModel instance) =>
    <String, dynamic>{
      'img': instance.img,
      'name': instance.name,
      'address': instance.address,
      'lat': instance.lat,
      'long': instance.long,
    };
