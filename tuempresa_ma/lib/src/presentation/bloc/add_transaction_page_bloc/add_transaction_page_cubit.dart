import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuempresa_ma/src/data/createFirestore.dart';
import 'package:tuempresa_ma/src/presentation/bloc/add_transaction_page_bloc/add_transaction_page_state.dart';

class AddTransactionPageCubit extends Cubit<AddTransactionPageState> {
  AddTransactionPageCubit() : super(InputTransactionInfoState());

  void checkRadio(bool val) {
    if (state is InputTransactionInfoState) {
      emit(InputTransactionInfoState(
        barCode: (state as InputTransactionInfoState).barCode,
        client: (state as InputTransactionInfoState).client,
        quantity: (state as InputTransactionInfoState).quantity,
        warehouse: (state as InputTransactionInfoState).warehouse,
        add: val,
      ));
    }
  }

  void inputCode(String code) {
    if (state is InputTransactionInfoState) {
      emit(InputTransactionInfoState(
        barCode: code,
        client: (state as InputTransactionInfoState).client,
        quantity: (state as InputTransactionInfoState).quantity,
        warehouse: (state as InputTransactionInfoState).warehouse,
      ));
    }
  }

  void inputClient(String client) {
    if (state is InputTransactionInfoState) {
      emit(InputTransactionInfoState(
        barCode: (state as InputTransactionInfoState).barCode,
        client: client,
        quantity: (state as InputTransactionInfoState).quantity,
        warehouse: (state as InputTransactionInfoState).warehouse,
      ));
    }
  }

  void inputWarehouse(String warehouse) {
    if (state is InputTransactionInfoState) {
      emit(InputTransactionInfoState(
        barCode: (state as InputTransactionInfoState).barCode,
        client: (state as InputTransactionInfoState).client,
        quantity: (state as InputTransactionInfoState).quantity,
        warehouse: warehouse,
      ));
    }
  }

  bool _isInt(String str) {
    try {
      var value = int.parse(str);
    } catch (e) {
      return false;
    }
    return true;
  }

  void inputQuantity(String quantity) {
    if (_isInt(quantity) && state is InputTransactionInfoState) {
      emit(InputTransactionInfoState(
        barCode: (state as InputTransactionInfoState).barCode,
        client: (state as InputTransactionInfoState).client,
        quantity: int.parse(quantity),
        warehouse: (state as InputTransactionInfoState).warehouse,
      ));
    }
  }

  void addButton() {
    emit(
      InputTransactionInfoState(
        barCode: (state as InputTransactionInfoState).barCode,
        client: (state as InputTransactionInfoState).client,
        quantity: (state as InputTransactionInfoState).quantity + 1,
      ),
    );
  }

  void removeButton() {
    emit(
      InputTransactionInfoState(
        barCode: (state as InputTransactionInfoState).barCode,
        client: (state as InputTransactionInfoState).client,
        quantity: (state as InputTransactionInfoState).quantity > 1
            ? (state as InputTransactionInfoState).quantity - 1
            : 1,
      ),
    );
  }

  Future<void> scanCode(BuildContext context) async {
    if (state is InputTransactionInfoState) {
      emit(WaitingAddTransactionState(
        barCode: (state as InputTransactionInfoState).barCode,
        client: (state as InputTransactionInfoState).client,
        quantity: (state as InputTransactionInfoState).quantity,
      ));

      final result = await Navigator.pushNamed(
        context,
        'scanpage',
      );

      if (result != null) {
        emit(InputTransactionInfoState(
          barCode: result as String,
          client: (state as WaitingAddTransactionState).client,
          quantity: (state as WaitingAddTransactionState).quantity,
        ));
      }
    }
  }

  Future<void> addTransaction(BuildContext context) async {
    if (state is InputTransactionInfoState) {
      final args = ModalRoute.of(context)!.settings.arguments as Map;

      String company = args["company"].toString();
      String email = args["email"].toString();
      int x = (state as InputTransactionInfoState).add ? 1 : -1;

      transaccion(
        company,
        (state as InputTransactionInfoState).quantity * x,
        (state as InputTransactionInfoState).barCode,
        email,
        (state as InputTransactionInfoState).barCode,
        (state as InputTransactionInfoState).warehouse,
      );

      Navigator.popUntil(context, ModalRoute.withName('homepage'));
    }
  }
}
