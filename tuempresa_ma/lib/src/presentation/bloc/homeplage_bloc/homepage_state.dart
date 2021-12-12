import 'package:equatable/equatable.dart';

class HomepageState extends Equatable {
  HomepageState()
      : _username = '',
        _password = '';

  String _username;
  String _password;

  String get username {
    return _username;
  }

  String get password {
    return _password;
  }

  set username(String newName) {
    _username = newName;
  }

  set password(String newPassword) {
    _password = newPassword;
  }

  @override
  List<Object?> get props => [_username, _password];
}
