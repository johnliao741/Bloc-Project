import 'dart:async';
import 'dart:math';

import 'package:my_bloc_project/data/fake/fake_data.dart';
import 'package:my_bloc_project/domain/data/home_info.dart';
import 'package:my_bloc_project/domain/data/user.dart';
import 'package:my_bloc_project/domain/entitis/get_banners_response.dart';
import 'package:my_bloc_project/domain/entitis/get_home_items_response.dart';
import 'package:my_bloc_project/domain/entitis/login_request.dart';
import 'package:my_bloc_project/domain/entitis/login_response.dart';
import 'package:my_bloc_project/domain/entitis/notify_number_response.dart';
import 'package:my_bloc_project/domain/repository/my_reponsitory.dart';

class MyRepositoryImp implements MyRepository {
  FakeData fakeData;

  MyRepositoryImp(this.fakeData);

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    return await Future.delayed(Duration(seconds: 1), () {
      if (request.account == "admin" && request.password == "password") {
        return LoginResponse(user: User("user01", "john", 0, 30))
          ..valid = "Y"
          ..message = "登入成功！！"
          ..status = 0;
      } else {
        return LoginResponse()
          ..valid = "N"
          ..message = "帳號密碼錯誤！！"
          ..status = 0;
      }
    });
  }

  @override
  FutureOr ondDispose() {
    // TODO: implement ondDispose
    throw UnimplementedError();
  }

  @override
  Future<NotifyNumberResponse> getNotifyNumber() async {
    return await Future.delayed(Duration(seconds: 1), () {
      return NotifyNumberResponse(Random().nextInt(30))
        ..status = 0
        ..message = ""
        ..valid = "Y";
    });
  }

  @override
  Future<GetBannersResponse> getBanners() async {
    return await Future.delayed(Duration(seconds: 1), () {
      return GetBannersResponse(fakeData.getBanners())
        ..status = 0
        ..message = "圖片錯誤"
        ..valid = "Y";
    });
  }

  @override
  Future<GetHomeItemsResponse> getHomeItems() async {
    return await Future.delayed(Duration(seconds: 1), () {
      return GetHomeItemsResponse(fakeData.getHomeItems()..shuffle())
        ..status = 0
        ..message = "讀取錯誤"
        ..valid = "Y";
    });
  }
}
