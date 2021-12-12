import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/homeplage_bloc/homepage_state.dart';

class HomepageCubit extends Cubit<HomepageState> {
  HomepageCubit() : super(HomepageState());

  void inputName(String newName) {
    state.username = newName;
    emit(state);
  }

  void inputPassword(String newPassword) {
    state.password = newPassword;
    emit(state);
  }

  void submit(BuildContext context) {
    Navigator.pushNamed(context, 'testpage',
        arguments: state.username + ' ' + state.password);
  }
}
