import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/presentation/bloc/productList_page_bloc/productList_page_cubit.dart';
import 'package:tuempresa_ma/src/presentation/bloc/productList_page_bloc/productList_page_view.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductListPageCubit(),
      child: ProductListPageView(),
    );
  }
}