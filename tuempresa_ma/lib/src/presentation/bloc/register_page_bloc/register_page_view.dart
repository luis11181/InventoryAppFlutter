import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/register_page_bloc/register_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/register_page_bloc/register_page_state.dart';

class RegisterPageView extends StatelessWidget {
  RegisterPageView({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Correo electronico no es valido';
    } else {
      return null;
    }
  }

  String? validateName(String? value) {
    String pattern = r'^[a-zA-Z0-9]+$';
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Nombre invalido';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Register')),
      body: BlocBuilder<RegisterPageCubit, RegisterPageState>(
        builder: (context, state) {
          return state is RegisterWaitingState
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ingresa los siguientes datos:',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  validator: validateName,
                                  decoration: InputDecoration(
                                    labelText: 'Nombre',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  initialValue:
                                      (state as RegisterInputState).name,
                                  onChanged: (text) => context
                                      .read<RegisterPageCubit>()
                                      .inputName(text),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  validator: validateName,
                                  decoration: InputDecoration(
                                    labelText: 'Apellido',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  initialValue: state.lastName,
                                  onChanged: (text) => context
                                      .read<RegisterPageCubit>()
                                      .inputLastName(text),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  validator: validateName,
                                  decoration: InputDecoration(
                                    icon: const Icon(Icons.person),
                                    labelText: 'Username',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  initialValue: (state).username,
                                  onChanged: (text) => context
                                      .read<RegisterPageCubit>()
                                      .inputUsername(text),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  validator: validateEmail,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    icon: const Icon(Icons.email),
                                    labelText: 'Correo',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  initialValue: state.email,
                                  onChanged: (text) => context
                                      .read<RegisterPageCubit>()
                                      .inputEmail(text),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  keyboardType: TextInputType.name,
                                  validator: validateName,
                                  decoration: InputDecoration(
                                    icon: const Icon(Icons.business),
                                    labelText: 'Nombre de empresa',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  initialValue: state.enterpriseName,
                                  onChanged: (text) => context
                                      .read<RegisterPageCubit>()
                                      .inputEnterpriseName(text),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value) {
                                    if (value != null) {
                                      if (value.trim().length < 6) {
                                        return 'La contraseña debe ser minimo de 6 caracteres';
                                      }
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: const Icon(Icons.password),
                                    labelText: 'Contraseña',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  initialValue: state.password,
                                  onChanged: (text) => context
                                      .read<RegisterPageCubit>()
                                      .inputPassword(text),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  obscureText: true,
                                  validator: (value) {
                                    if (value != null) {
                                      if (value != state.password) {
                                        return 'La contraseña es diferente';
                                      }
                                      if (value.trim().length < 6) {
                                        return 'La contraseña debe ser minimo de 6 caracteres';
                                      }
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: const Icon(Icons.password),
                                    labelText: 'Confirmar Contraseña',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 3,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  initialValue: state.confirmPassword,
                                  onChanged: (text) => context
                                      .read<RegisterPageCubit>()
                                      .inputConfirmPassword(text),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => context
                          .read<RegisterPageCubit>()
                          .register(context, _formKey),
                      child: const Text('Registrarse'),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
