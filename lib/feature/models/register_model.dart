import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'register_model.g.dart';

@JsonSerializable()
@immutable
final class RegisterResponseModel implements BaseModel<RegisterResponseModel> {
  final int? id;
  final String? token;

  const RegisterResponseModel({
    this.id,
    this.token,
  });

  @override
  RegisterResponseModel fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}
