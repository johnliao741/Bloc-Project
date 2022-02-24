// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeInfo _$HomeInfoFromJson(Map<String, dynamic> json) => HomeInfo(
      (json['banners'] as List<dynamic>?)
          ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['items'] as List<dynamic>?)
          ?.map((e) => ItemInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeInfoToJson(HomeInfo instance) => <String, dynamic>{
      'banners': instance.banners?.map((e) => e.toJson()).toList(),
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };

Banner _$BannerFromJson(Map<String, dynamic> json) => Banner(
      json['id'] as String?,
      json['imgUrl'] as String?,
      json['event'] == null
          ? null
          : BannerEvent.fromJson(json['event'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'event': instance.event?.toJson(),
    };

BannerEvent _$BannerEventFromJson(Map<String, dynamic> json) => BannerEvent(
      $enumDecodeNullable(_$BannerTypeEnumMap, json['bannerType']),
      json['description'] as String?,
    );

Map<String, dynamic> _$BannerEventToJson(BannerEvent instance) =>
    <String, dynamic>{
      'bannerType': _$BannerTypeEnumMap[instance.bannerType],
      'description': instance.description,
    };

const _$BannerTypeEnumMap = {
  BannerType.non: 'non',
  BannerType.browser: 'browser',
  BannerType.push: 'push',
  BannerType.imgDialog: 'imgDialog',
  BannerType.textDialog: 'textDialog',
};

ItemInfo _$ItemInfoFromJson(Map<String, dynamic> json) => ItemInfo(
      json['id'] as String?,
      json['imgUrl'] as String?,
      json['title'] as String?,
      json['subTitle'] as String?,
    );

Map<String, dynamic> _$ItemInfoToJson(ItemInfo instance) => <String, dynamic>{
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'title': instance.title,
      'subTitle': instance.subTitle,
    };
