
import 'package:get_it/get_it.dart';
import 'package:my_bloc_project/domain/data/home_info.dart';
import 'package:my_bloc_project/domain/entitis/get_banners_response.dart';
import 'package:my_bloc_project/domain/entitis/get_home_items_response.dart';
import 'package:my_bloc_project/domain/entitis/login_request.dart';
import 'package:my_bloc_project/domain/entitis/login_response.dart';
import 'package:my_bloc_project/domain/entitis/notify_number_response.dart';

abstract class MyRepository implements Disposable{
  Future<LoginResponse> login(LoginRequest request);
  Future<NotifyNumberResponse> getNotifyNumber();
  Future<GetBannersResponse> getBanners();
  Future<GetHomeItemsResponse> getHomeItems();
}