
import 'package:json_annotation/json_annotation.dart';
import 'package:my_bloc_project/domain/entitis/my_response.dart';
import 'package:my_bloc_project/domain/repository/my_reponsitory.dart';


part 'notify_number_response.g.dart';
@JsonSerializable()
class NotifyNumberResponse extends MyResponse{
  int? amount;
  NotifyNumberResponse(this.amount,{int? status, String? message, String? valid}) : super(status, message, valid);
  factory NotifyNumberResponse.fromJson(Map<String, dynamic> json) => _$NotifyNumberResponseFromJson(json);
  Map<String, dynamic> toJson() {
    return _$NotifyNumberResponseToJson(this);
  }

  @override
  String toString() {
    return 'NotifyNumberResponse{amount: $amount} ${super.toString()}';
  }
}