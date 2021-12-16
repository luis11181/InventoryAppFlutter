import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/login_page_bloc/login_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/login_page_bloc/login_page_state.dart';

import 'package:tuempresa_ma/src/presentation/theme_cubit.dart';

class LoginPageView extends StatelessWidget {
  /// {@macro app_view}
  const LoginPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Login')),
      body: BlocBuilder<LoginPageCubit, LoginPageState>(
        builder: (context, state) {
          return state is LoginWaitingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'TuEmpresa',
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Image.asset(
                      'assets/img/warehouse-inventory-icon.png',
                      color: Theme.of(context).colorScheme.primary,
                      scale: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        initialValue: (state as LoginInputState).email,
                        decoration: InputDecoration(
                          labelText: 'Correo del Usuario',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        //* pedia el ususario pero se requiere es el correo, por lo tanto se cambio el texto para que reciba el correo y no el usuario.
                        onChanged: (text) =>
                            context.read<LoginPageCubit>().inputUsername(text),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        initialValue: (state as LoginInputState).password,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onChanged: (text) =>
                            context.read<LoginPageCubit>().inputPassword(text),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<LoginPageCubit>().login(context),
                      child: const Text('Iniciar Sesión'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('¿Olvidaste tu contraseña?'),
                    ),
                    Divider(),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<LoginPageCubit>().goRegister(context),
                      child: const Text('Registrate'),
                    ),
                  ],
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.brightness_6),
        mini: true,
        onPressed: () => context.read<ThemeCubit>().toggleTheme(),
      ),
    );
  }
}
