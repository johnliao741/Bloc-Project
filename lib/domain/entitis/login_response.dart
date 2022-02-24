
import 'package:json_annotation/json_annotation.dart';
import 'package:my_bloc_project/domain/data/user.dart';
import 'package:my_bloc_project/domain/entitis/my_response.dart';

part 'login_response.g.dart';
@JsonSerializable(explicitToJson: true)
class LoginResponse extends MyResponse{
  User? user;
  LoginResponse({this.user,int? status, String? message, String? valid}) : super(status, message, valid);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() {
    return _$LoginResponseToJson(this);
  }

  @override
  String toString() {
    return 'LoginResponse{user: $user} ${super.toString()}';
  }
}