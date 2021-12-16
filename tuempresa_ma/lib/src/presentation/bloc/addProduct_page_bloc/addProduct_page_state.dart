import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AddProductPageState extends Equatable {
  AddProductPageState({
    this.cantidad ='0',
    
  });

  String cantidad;

  @override
  List<Object?> get props => [cantidad];
}
