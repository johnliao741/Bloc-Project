

import 'package:get_it/get_it.dart';
import 'package:my_bloc_project/data/fake/fake_data.dart';
import 'package:my_bloc_project/data/repository/fake_repository.dart';
import 'package:my_bloc_project/domain/entitis/get_home_items_response.dart';
import 'package:my_bloc_project/domain/repository/my_reponsitory.dart';
import 'package:my_bloc_project/domain/usecase/get_banners_usecase.dart';
import 'package:my_bloc_project/domain/usecase/get_home_items_usecase.dart';
import 'package:my_bloc_project/domain/usecase/get_notify_number_usecase.dart';
import 'package:my_bloc_project/domain/usecase/login_usecase.dart';

final getIt = GetIt.instance;
///true => fake environment
bool debugMode = false;
Future<void> setup({bool? developerDebugMode}) async {
  final fakeData = FakeData();
  getIt.registerSingleton<MyRepository>(MyRepositoryImp(fakeData));

  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => GetBannersUseCase(getIt()));
  getIt.registerLazySingleton(() => GetHomeItemsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetNotifyNumberUseCase(getIt()));
}