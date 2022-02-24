
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:my_bloc_project/domain/entitis/get_banners_response.dart';

import 'package:my_bloc_project/domain/repository/my_reponsitory.dart';
import 'package:my_bloc_project/domain/usecase/usecase.dart';
import 'package:my_bloc_project/domain/util/extension.dart';


class GetBannersUseCase extends UseCase<VoidParams,GetBannersResponse>{
  MyRepository repository;
  GetBannersUseCase(this.repository);
  @override
  Future<GetBannersResponse> call(VoidParams param) async{
    var response = await repository.getBanners()..verifyApi();
    Logger.e(response.toString());
    return response;
  }
}