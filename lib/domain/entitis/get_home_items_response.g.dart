// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_home_items_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHomeItemsResponse _$GetHomeItemsResponseFromJson(
        Map<String, dynamic> json) =>
    GetHomeItemsResponse(
      (json['itemInfos'] as List<dynamic>?)
          ?.map((e) => ItemInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int?,
      message: json['message'] as String?,
      valid: json['valid'] as String?,
    );

Map<String, dynamic> _$GetHomeItemsResponseToJson(
        GetHomeItemsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'valid': instance.valid,
      'itemInfos': instance.itemInfos?.map((e) => e.toJson()).toList(),
    };
