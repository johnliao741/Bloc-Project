

import 'package:my_bloc_project/domain/entitis/my_response.dart';

class ResultState<T> {

  ResultState init(){
    return ResultState();
  }

  ResultState clone(){
    return ResultState();
  }
}
class InitState extends ResultState{

}
class LoadingState extends ResultState{

}
class LoadedState extends ResultState{

}

class SuccessState<T extends MyResponse> extends ResultState<T>{
  T? data;
  SuccessState({this.data});
  @override
  ResultState clone() {
    return SuccessState()
      ..data = data;
  }
}
class ErrorState extends ResultState{
  var errorMsg;
  @override
  ResultState clone() {
    return ErrorState()
      ..errorMsg = errorMsg;
  }
}

