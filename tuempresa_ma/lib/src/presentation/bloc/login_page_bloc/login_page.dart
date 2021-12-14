import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/login_page_bloc/login_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/login_page_bloc/login_page_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginPageCubit(),
      child: const LoginPageView(),
    );
  }
}
