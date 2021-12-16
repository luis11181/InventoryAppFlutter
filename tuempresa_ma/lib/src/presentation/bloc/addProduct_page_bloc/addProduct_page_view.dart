import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/addProduct_page_bloc/addProduct_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/addProduct_page_bloc/addProduct_page_state.dart';

import 'package:tuempresa_ma/src/presentation/theme_cubit.dart';

class AddProductPageView extends StatelessWidget {
  /// {@macro app_view}
  const AddProductPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Add Product')),
      body: BlocBuilder<AddProductPageCubit, AddProductPageState>(
        builder: (context, state) {
          return Column(
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
                  initialValue: state
                      .username, //* pedia el ususario pero se requiere es el correo, por lo tanto se cambio el texto para que reciba el correo y no el usuario.
                  onChanged: (text) =>
                      context.read<AddProductPageCubit>().inputUsername(text),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  obscureText: true,
                  initialValue: state.password,
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
                      context.read<AddProductPageCubit>().inputPassword(text),
                ),
              ),
              ElevatedButton(
                onPressed: () => context.read<AddProductPageCubit>().login(context),
                child: const Text('Iniciar Sesión'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('¿Olvidaste tu contraseña?'),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () =>
                    context.read<AddProductPageCubit>().goRegister(context),
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
