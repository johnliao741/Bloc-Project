
import 'package:my_bloc_project/domain/entitis/login_response.dart';
import 'package:my_bloc_project/domain/entitis/my_response.dart';
import 'package:my_bloc_project/domain/my_exception/my_exception.dart';

extension Dp on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

extension Verify on MyResponse {

  void verifyApi() {
    if(this is MyResponse){
      if(status != 0 || valid != "Y"){
        throw ApiException(message ?? "Api Error");
      }
    }else{
      throw ExtendsException("Response Error");
    }

  }
}