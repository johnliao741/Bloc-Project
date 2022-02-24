abstract class LoginEvent {}

class InitEvent extends LoginEvent {}

class LoginAccountEvent extends LoginEvent {
  var acc;
  var pass;
  LoginAccountEvent(this.acc,this.pass);

}

class LogoutAccountEvent extends LoginEvent {}

