import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/login_page_bloc/login_page.dart';
import 'package:tuempresa_ma/src/presentation/bloc/register_page_bloc/register_page.dart';
import 'package:tuempresa_ma/src/presentation/bloc/scan_page_bloc/scan_page.dart';

import 'package:tuempresa_ma/src/presentation/bloc/testpage.dart';

import 'theme_cubit.dart';

class App extends StatelessWidget {
  /// {@macro app}
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (_, theme) {
        return MaterialApp(
          title: 'TuEmpresa Mobile App',
          theme: theme,
          initialRoute: '/',
          routes: {
            '/': (context) => const LoginPage(),
            'register': (context) => const RegisterPage(),
            'testpage': (context) => TestPage(),
            'scanpage': (context) => const ScanPage(),
          },
        );
      },
    );
  }
}
