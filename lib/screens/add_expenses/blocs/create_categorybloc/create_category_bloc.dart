import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';
import 'dart:developer';


part 'create_category_event.dart';
part 'create_category_state.dart';

class CreateCategoryBloc extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final ExpenseRepository expenseRepository;

  CreateCategoryBloc(this.expenseRepository) : super(CreateCategoryInitial()) {
    on<CreateCategoryEvent>((event, emit) async {
      if (event is CreateCategory) {
        emit(CreateCategoryLoading());
        try {
          await expenseRepository.createCategory(event.category);
          emit(CreateCategorySuccess());
        } catch (e) {
          emit(CreateCategoryFailure());
          log('BLoC Error: ${e.toString()}');
        }
      }
    });

  }
}
