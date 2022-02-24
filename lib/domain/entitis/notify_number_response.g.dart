// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notify_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifyNumberResponse _$NotifyNumberResponseFromJson(
        Map<String, dynamic> json) =>
    NotifyNumberResponse(
      json['amount'] as int?,
      status: json['status'] as int?,
      message: json['message'] as String?,
      valid: json['valid'] as String?,
    );

Map<String, dynamic> _$NotifyNumberResponseToJson(
        NotifyNumberResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'valid': instance.valid,
      'amount': instance.amount,
    };
