abstract class RegisterPageState {}

class RegisterWaitingState implements RegisterPageState {}

// ignore: must_be_immutable
class RegisterInputState implements RegisterPageState {
  RegisterInputState({
    this.name = '',
    this.lastName = '',
    this.username = '',
    this.password = '',
    this.email = '',
    this.enterpriseName = '',
    this.confirmPassword = '',
  }) : readyToSubmit = false;

  String name;
  String lastName;
  String username;
  String email;
  String enterpriseName;
  String password;
  String confirmPassword;
  bool readyToSubmit;
}
