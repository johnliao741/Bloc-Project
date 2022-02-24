
class MyResponse{
  int? status;
  String? message;
  String? valid;
  MyResponse(this.status,this.message,this.valid);

  @override
  String toString() {
    return 'MyResponse{status: $status, message: $message, valid: $valid}';
  }
}