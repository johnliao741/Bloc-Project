
import 'package:json_annotation/json_annotation.dart';
import 'package:my_bloc_project/domain/data/home_info.dart';
import 'package:my_bloc_project/domain/entitis/my_response.dart';

part 'get_home_items_response.g.dart';
@JsonSerializable(explicitToJson: true)
class GetHomeItemsResponse extends MyResponse{

  List<ItemInfo>? itemInfos;
  GetHomeItemsResponse(this.itemInfos,{int? status, String? message, String? valid}) : super(status, message, valid);

  factory GetHomeItemsResponse.fromJson(Map<String, dynamic> json) => _$GetHomeItemsResponseFromJson(json);
  Map<String, dynamic> toJson() {
    return _$GetHomeItemsResponseToJson(this);
  }

  @override
  String toString() {
    return 'GetHomeItemsResponse{itemInfos: $itemInfos} ${super.toString()}';
  }
}