import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ScanPageState extends Equatable {
  ScanPageState({
    this.code = 'No code',
  })  : isCamActive = false,
        read = false;

  String code;
  bool isCamActive;
  bool read;

  @override
  List<Object?> get props => [code, isCamActive];
}
