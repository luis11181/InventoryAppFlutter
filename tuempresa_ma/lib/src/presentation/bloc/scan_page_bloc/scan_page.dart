import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/scan_page_bloc/scan_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/scan_page_bloc/scan_page_view.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScanPageCubit(),
      child: ScanPageView(),
    );
  }
}
