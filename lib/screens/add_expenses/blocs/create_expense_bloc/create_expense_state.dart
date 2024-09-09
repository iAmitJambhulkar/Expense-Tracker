part of 'create_expense_bloc.dart';

sealed class CreateExpenseState extends Equatable {
  const CreateExpenseState();
}

final class CreateExpenseInitial extends CreateExpenseState {
  @override
  List<Object> get props => [];
}

final class CreateExpenseFailure extends CreateExpenseState {
  final String error;

  const CreateExpenseFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class CreateExpenseLoading extends CreateExpenseState {
  @override
  List<Object> get props => [];
}

final class CreateExpenseSuccess extends CreateExpenseState {
  @override
  List<Object> get props => [];
}
