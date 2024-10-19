import 'package:json_annotation/json_annotation.dart';

part 'basic_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BasicResponse<T> {
  final int? code;
  final String? mess;
  final T? data;

  BasicResponse({
    this.code,
    this.mess,
    this.data,
  });

  // Factory for deserializing JSON
  factory BasicResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BasicResponseFromJson(json, fromJsonT);

  // Method for serializing to JSON
  Map<String, dynamic> toJson(Object Function(T? value) toJsonT) =>
      _$BasicResponseToJson(this, toJsonT);

  toList() {}
}
