import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tuempresa_ma/src/presentation/bloc/register_page_bloc/register_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/register_page_bloc/register_page_view.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterPageCubit(),
      child: RegisterPageView(),
    );
  }
}
