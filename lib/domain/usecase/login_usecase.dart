
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:my_bloc_project/domain/entitis/login_request.dart';
import 'package:my_bloc_project/domain/entitis/login_response.dart';
import 'package:my_bloc_project/domain/repository/my_reponsitory.dart';
import 'package:my_bloc_project/domain/usecase/usecase.dart';
import 'package:my_bloc_project/domain/util/extension.dart';
class LoginUseCase extends UseCase<LoginRequest,LoginResponse>{
  final MyRepository _repository;
  LoginUseCase(this._repository);

  @override
  Future<LoginResponse> call(LoginRequest request) async{
    var response = await _repository.login(request)..verifyApi();
    Logger.e(response.toString());

    return response;
  }
}