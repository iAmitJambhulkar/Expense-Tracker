part of 'get_expenses_bloc.dart';

sealed class GetExpensesState extends Equatable {
  const GetExpensesState();
}

final class GetExpensesInitial extends GetExpensesState {
  @override
  List<Object> get props => [];
}

final class GetExpensesFailure extends GetExpensesState {
  final String error;

  const GetExpensesFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class GetExpensesLoading extends GetExpensesState {
  @override
  List<Object> get props => [];
}

final class GetExpensesSuccess extends GetExpensesState {
  final  List<Expense> expenses;

  const GetExpensesSuccess(this.expenses);

  @override
  List<Object> get props => [expenses];
}