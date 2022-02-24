import 'package:bloc/bloc.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:my_bloc_project/domain/data/user.dart';
import 'package:my_bloc_project/domain/entitis/login_request.dart';
import 'package:my_bloc_project/domain/entitis/login_response.dart';
import 'package:my_bloc_project/domain/my_exception/my_exception.dart';
import 'package:my_bloc_project/domain/usecase/login_usecase.dart';

import 'event.dart';
import '../common/state.dart';

class LoginBloc extends Bloc<LoginEvent, ResultState> {
  LoginUseCase _loginUseCase;
  LoginBloc(this._loginUseCase) : super(InitState()) {
    on<InitEvent>(_init);
    on<LoginAccountEvent>(_login);
    on<LogoutAccountEvent>(_logout);
  }

  void _init(InitEvent event, Emitter<ResultState> emit) async {
    emit(InitState());
  }

  void _login(LoginAccountEvent event, Emitter<ResultState> emit) async {
    emit(LoadingState());
    try{
      var result = await _loginUseCase(LoginRequest(account:event.acc, password:event.pass));
      emit(SuccessState<LoginResponse>(data: result));
    }catch(e){
      if(e is ApiException){
        emit(ErrorState()
          ..errorMsg = e.errorMsg);
      }
    }
  }

  void _logout(LogoutAccountEvent event, Emitter<ResultState> emit) async {
    if(state is SuccessState){
      emit(LoadedState());
    }
  }
}
