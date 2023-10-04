import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'base_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
@immutable
final class UserModel implements BaseModel<UserModel> {
  final int? id;
  final String? email;
  @JsonKey(name: "first_name")
  final String? firstName;
  @JsonKey(name: "last_name")
  final String? lastName;
  final String? avatar;



  const UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  @override
  UserModel fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override 
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
