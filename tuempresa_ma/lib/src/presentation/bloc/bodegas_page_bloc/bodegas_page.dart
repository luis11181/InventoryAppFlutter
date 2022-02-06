import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bodegas_page_bloc.dart';
import 'bodegas_page_view.dart';

class BodegasPage extends StatelessWidget {
  const BodegasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BodegasPageCubit(),
      child: const BodegasPageView(),
    );
  }
}