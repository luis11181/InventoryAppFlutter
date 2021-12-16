abstract class LoginPageState {}

class WaitingState implements LoginPageState {}

class InputState implements LoginPageState {
  InputState({
    this.email = '',
    this.password = '',
  });

  String email;
  String password;
}
