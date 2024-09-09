part of 'get_categories_bloc.dart';

sealed class GetCategoriesState extends Equatable {
  const GetCategoriesState();
}

final class GetCategoriesInitial extends GetCategoriesState {
  @override
  List<Object> get props => [];
}

final class GetCategoriesFailure extends GetCategoriesState{

  @override
  List<Object?> get props => [];
}
final class GetCategoriesLoading extends GetCategoriesState{
  @override
  List<Object?> get props => [];
}

final class GetCategoriesSuccess extends GetCategoriesState{
  final List<Category> categories;

  const GetCategoriesSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}
