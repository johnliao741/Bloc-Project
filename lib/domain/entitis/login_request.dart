
import 'package:json_annotation/json_annotation.dart';

///Terminal -> flutter pub run build_runner build
part 'login_request.g.dart';
@JsonSerializable()
class LoginRequest{
  String? account;
  String? password;

  LoginRequest({this.account,this.password});


  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() {
    return _$LoginRequestToJson(this);
  }
}