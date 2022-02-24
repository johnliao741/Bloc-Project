
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:my_bloc_project/domain/entitis/notify_number_response.dart';
import 'package:my_bloc_project/domain/repository/my_reponsitory.dart';
import 'package:my_bloc_project/domain/usecase/usecase.dart';
import 'package:my_bloc_project/domain/util/extension.dart';

class GetNotifyNumberUseCase extends UseCase<VoidParams,NotifyNumberResponse>{
  MyRepository myRepository;
  GetNotifyNumberUseCase(this.myRepository);
  @override
  Future<NotifyNumberResponse> call(VoidParams param) async{
    var response = await myRepository.getNotifyNumber()..verifyApi();
    Logger.e(response.toString());
    return response;
  }
}