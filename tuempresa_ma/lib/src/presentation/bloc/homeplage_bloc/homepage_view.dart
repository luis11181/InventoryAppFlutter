import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tuempresa_ma/src/presentation/bloc/homeplage_bloc/homepage_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/homeplage_bloc/homepage_state.dart';
import 'package:tuempresa_ma/src/presentation/theme_cubit.dart';

class HomePageView extends StatelessWidget {
  /// {@macro app_view}
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Homepage')),
      body: Center(
        child: BlocBuilder<HomepageCubit, HomepageState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'username',
                    labelText: 'Username *',
                  ),
                  initialValue: state.username,
                  onChanged: (text) =>
                      context.read<HomepageCubit>().inputName(text),
                ),
                TextFormField(
                  obscureText: true,
                  initialValue: state.password,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: 'password',
                    labelText: 'Password *',
                  ),
                  onChanged: (text) =>
                      context.read<HomepageCubit>().inputPassword(text),
                ),
                ElevatedButton(
                    onPressed: () =>
                        context.read<HomepageCubit>().submit(context),
                    child: Text('submit')),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.brightness_6),
        onPressed: () => context.read<ThemeCubit>().toggleTheme(),
      ),
    );
  }
}
