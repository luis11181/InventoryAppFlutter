import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomepageEvent {}

/// Notifies bloc to increment state.
class Increment extends HomepageEvent {}

/// Notifies bloc to decrement state.
class Decrement extends HomepageEvent {}

/// {@template counter_bloc}
/// A simple [Bloc] that manages an `int` as its state.
/// {@endtemplate}
class HomepageBloc extends Bloc<HomepageEvent, int> {
  /// {@macro counter_bloc}
  HomepageBloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
  }
}
