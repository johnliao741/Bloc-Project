
import 'package:my_bloc_project/domain/data/enum/banner_type.dart';
import 'package:my_bloc_project/domain/data/home_info.dart';

class FakeData{

  List<Banner> getBanners(){
    var banners =  List.generate(5, (index) => Banner("id$index", imgUrls[index], bannerEvents[index]));
    return banners;
  }
  List<ItemInfo> getHomeItems(){
    var homeItems =  List.generate(5, (index) => ItemInfo("id$index", imgUrls[index],"title$index","subTitle$index"));
    return homeItems;
  }
  final imgUrls = ["https://www.dropbox.com/s/3qcr9vb2xz9zdqk/%E5%8C%85%E9%9E%8B%E9%A1%9E%28%E5%89%8D%E5%8C%85%E5%BE%8C%E5%8C%85%291.jpg?dl=1",
    "https://www.dropbox.com/s/gz1pe8tsygz6x4y/%E6%B6%BC%E6%8B%96%E9%9E%8B%E9%A1%9E1.jpg?dl=1",
    "https://www.dropbox.com/s/321cw9481d670m6/%E6%B6%BC%E9%9E%8B%E9%A1%9E%28%E5%89%8D%E7%A9%BA%E5%BE%8C%E7%A9%BA%291.jpg?dl=1",
    "https://www.dropbox.com/s/y4tel1kvnn9sfjy/%E9%AD%9A%E5%8F%A3_%E6%B6%BC%E9%9E%8B%E9%A1%9E%28%E5%89%8D%E7%A9%BA%E5%BE%8C%E5%8C%85%29.jpg?dl=1",
    "https://www.dropbox.com/s/41whzxa0xjcz6y7/%E9%9D%B4%E6%AC%BE%28%E6%9C%89%E6%8B%89%E9%8D%8A_%E9%AC%86%E7%B7%8A%E5%B8%B6%291.jpg?dl=1"];

  final bannerEvents = [BannerEvent(BannerType.non, ""),
    BannerEvent(BannerType.browser, "https://google.com"),
    BannerEvent(BannerType.push, ""),
    BannerEvent(BannerType.imgDialog, "https://www.dropbox.com/s/3qcr9vb2xz9zdqk/%E5%8C%85%E9%9E%8B%E9%A1%9E%28%E5%89%8D%E5%8C%85%E5%BE%8C%E5%8C%85%291.jpg?dl=1"),
    BannerEvent(BannerType.textDialog, "鞋子特賣中，期間只在yyyy/MM/dd ~ yyyy/MM/dd，趕快來搶購。")];

}