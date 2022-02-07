import 'package:tuempresa_ma/src/domain/product.dart';

abstract class ProductListPageState {}

class ProductListDisplayState implements ProductListPageState {
  ProductListDisplayState({
    required this.products,
    required this.productName
  });

  List<Product> products;
  String productName;
}

class ProductPageWaitingState implements ProductListPageState {
  ProductPageWaitingState({ this.productName = ""});
  String productName;
}