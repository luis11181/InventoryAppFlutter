import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/bodegas_page_bloc/bodegas_page.dart';
import 'package:tuempresa_ma/src/presentation/bloc/empleados_page/empleados_page.dart';
import 'package:tuempresa_ma/src/presentation/bloc/login_page_bloc/login_page.dart';
import 'package:tuempresa_ma/src/presentation/bloc/register_page_bloc/register_page.dart';
import 'package:tuempresa_ma/src/presentation/bloc/scan_page_bloc/scan_page.dart';
import 'package:tuempresa_ma/src/presentation/bloc/productList_page_bloc/productList_page.dart';

import 'package:tuempresa_ma/src/presentation/bloc/testpage.dart';
import 'package:tuempresa_ma/src/presentation/home_page.dart';
import 'package:tuempresa_ma/src/presentation/bloc/addProduct_page_bloc/addProduct_page.dart';
import 'package:tuempresa_ma/src/presentation/bloc/transaction_page_bloc/transaction_page.dart';

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
          initialRoute: '/', //cambiar a loginpage, a '/'
          routes: {
            '/': (context) => const LoginPage(),
            'register': (context) => const RegisterPage(),
            'homepage': (context) => const HomePage(),
            'testpage': (context) => const TestPage(),
            'scanpage': (context) => const ScanPage(),
            'addProduct': (context) => const AddProductPage(),
            'productListpage': (context) => const ProductListPage(),
            'transaction': (context) => const TransactionPage(),
            'employers' : (context) => const EmpleadosPage(),
            'storages': (context) => const BodegasPage()
          },
        );
      },
    );
  }
}
