import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
@immutable
final class AuthResponseModel implements BaseModel<AuthResponseModel> {
  final int? id;
  final String? token;

  const AuthResponseModel({
    this.id,
    this.token,
  });

  @override
  AuthResponseModel fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}
