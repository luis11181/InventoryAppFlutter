abstract class LoginPageState {}

class LoginWaitingState implements LoginPageState {}

class LoginInputState implements LoginPageState {
  LoginInputState({
    this.email = '',
    this.password = '',
  });

  String email;
  String password;
}
