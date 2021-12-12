import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tuempresa_ma/src/presentation/bloc/homeplage_bloc/homepage_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/homeplage_bloc/homepage_view.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomepageCubit(),
      child: const HomePageView(),
    );
  }
}
