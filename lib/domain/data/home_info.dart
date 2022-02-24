


import 'package:json_annotation/json_annotation.dart';
import 'enum/banner_type.dart';

part 'home_info.g.dart';
@JsonSerializable(explicitToJson: true)
class HomeInfo{
  List<Banner>? banners;
  List<ItemInfo>? items;
  HomeInfo(this.banners,this.items);

  factory HomeInfo.fromJson(Map<String, dynamic> json) => _$HomeInfoFromJson(json);
  Map<String, dynamic> toJson() {
    return _$HomeInfoToJson(this);
  }

  @override
  String toString() {
    return 'HomeInfo{banners: $banners, items: $items}';
  }
}
@JsonSerializable(explicitToJson: true)
class Banner{
  String? id;
  String? imgUrl;
  BannerEvent? event;
  Banner(this.id,this.imgUrl,this.event);
  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);
  Map<String, dynamic> toJson() {
    return _$BannerToJson(this);
  }

  @override
  String toString() {
    return 'Banner{id: $id, imgUrl: $imgUrl, event: $event}';
  }
}
@JsonSerializable(explicitToJson: true)
class BannerEvent{
  BannerType? bannerType;
  String? description;
  BannerEvent(this.bannerType,this.description);
  factory BannerEvent.fromJson(Map<String, dynamic> json) => _$BannerEventFromJson(json);
  Map<String, dynamic> toJson() {
    return _$BannerEventToJson(this);
  }

  @override
  String toString() {
    return 'BannerEvent{bannerType: $bannerType, description: $description}';
  }
}
@JsonSerializable()
class ItemInfo{
  String? id;
  String? imgUrl;
  String? title;
  String? subTitle;
  ItemInfo(this.id,this.imgUrl,this.title,this.subTitle);
  factory ItemInfo.fromJson(Map<String, dynamic> json) => _$ItemInfoFromJson(json);
  Map<String, dynamic> toJson() {
    return _$ItemInfoToJson(this);
  }

  @override
  String toString() {
    return 'ItemInfo{id: $id, imgUrl: $imgUrl, title: $title, subTitle: $subTitle}';
  }
}

