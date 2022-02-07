import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/add_transaction_page_bloc/add_transaction_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/add_transaction_page_bloc/add_transaction_page_view.dart';

class AddTransactionPage extends StatelessWidget {
  const AddTransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddTransactionPageCubit(),
      child: const AddTransactionPageView(),
    );
  }
}
