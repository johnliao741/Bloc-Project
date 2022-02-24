
class ApiException implements Exception{
  String errorMsg;
  ApiException(this.errorMsg);

  @override
  String toString() {
    return '$errorMsg';
  }
}
class ExtendsException implements Exception{
  String errorMsg;
  ExtendsException(this.errorMsg);

  @override
  String toString() {
    return 'ExtendsException{errorMsg: $errorMsg}';
  }
}