abstract class AddTransactionPageState {}

class InputTransactionInfoState extends AddTransactionPageState {
  final String barCode;
  final String client;
  final int quantity;
  final String warehouse;
  final bool add;
  InputTransactionInfoState({
    this.barCode = '',
    this.client = '',
    this.quantity = 1,
    this.warehouse = '',
    this.add = true,
  });
}

class WaitingAddTransactionState extends AddTransactionPageState {
  final String barCode;
  final String client;
  final int quantity;
  final String warehouse;
  final bool add;
  WaitingAddTransactionState({
    this.barCode = '',
    this.client = '',
    this.quantity = 1,
    this.warehouse = '',
    this.add = true,
  });
}
