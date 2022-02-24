
import 'package:json_annotation/json_annotation.dart';
import 'package:my_bloc_project/domain/data/home_info.dart';
import 'package:my_bloc_project/domain/entitis/my_response.dart';

part 'get_banners_response.g.dart';
@JsonSerializable(explicitToJson: true)
class GetBannersResponse extends MyResponse{

  List<Banner>? banners;
  GetBannersResponse(this.banners,{int? status, String? message, String? valid}) : super(status, message, valid);

  factory GetBannersResponse.fromJson(Map<String, dynamic> json) => _$GetBannersResponseFromJson(json);
  Map<String, dynamic> toJson() {
    return _$GetBannersResponseToJson(this);
  }

  @override
  String toString() {
    return 'GetBannersResponse{banners: $banners} ${super.toString()}';
  }
}