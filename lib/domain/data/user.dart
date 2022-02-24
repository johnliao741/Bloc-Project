
import 'package:json_annotation/json_annotation.dart';
import '../entitis/my_response.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User{
  String id;
  String name;
  int gender;
  int age;
  User(this.id,this.name,this.gender,this.age);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, gender: $gender, age: $age}';
  }
}