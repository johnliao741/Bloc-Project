
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:my_bloc_project/domain/entitis/get_banners_response.dart';
import 'package:my_bloc_project/domain/entitis/get_home_items_response.dart';
import 'package:my_bloc_project/domain/repository/my_reponsitory.dart';
import 'package:my_bloc_project/domain/usecase/usecase.dart';
import 'package:my_bloc_project/domain/util/extension.dart';

class GetHomeItemsUseCase extends UseCase<VoidParams,GetHomeItemsResponse>{
  MyRepository repository;
  GetHomeItemsUseCase(this.repository);
  @override
  Future<GetHomeItemsResponse> call(VoidParams param) async{
    var response = await repository.getHomeItems()..verifyApi();
    Logger.e(response.toString());
    return response;
  }
}