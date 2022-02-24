// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_banners_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBannersResponse _$GetBannersResponseFromJson(Map<String, dynamic> json) =>
    GetBannersResponse(
      (json['banners'] as List<dynamic>?)
          ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as int?,
      message: json['message'] as String?,
      valid: json['valid'] as String?,
    );

Map<String, dynamic> _$GetBannersResponseToJson(GetBannersResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'valid': instance.valid,
      'banners': instance.banners?.map((e) => e.toJson()).toList(),
    };
