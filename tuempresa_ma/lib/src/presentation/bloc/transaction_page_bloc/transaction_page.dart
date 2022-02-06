import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/transaction_page_bloc/transaction_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/transaction_page_bloc/transaction_page_view.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TransactionPageCubit(),
      child: const TransactionPageView(),
    );
  }
}
