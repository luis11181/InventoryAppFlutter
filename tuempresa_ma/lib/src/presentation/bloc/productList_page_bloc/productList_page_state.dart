import 'package:tuempresa_ma/src/domain/product.dart';

abstract class ProductListPageState {}

class ProductListWaitingState implements ProductListPageState {}

class ProductListDisplayState implements ProductListPageState {
  ProductListDisplayState({
    required this.products,
    this.productName = '',
  });

  List<Product> products;
  String productName;
}