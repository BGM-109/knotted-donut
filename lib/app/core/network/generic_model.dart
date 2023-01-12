import 'package:json_annotation/json_annotation.dart';
part 'generic_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class DataModel<T> {
  final List<T> data;
  final int total;
  DataModel({required this.data, required this.total});

  factory DataModel.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$DataModelFromJson<T>(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$DataModelToJson<T>(this, toJsonT);
}
