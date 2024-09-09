import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/expense_repository.dart';

class FirebaseExpenseRepo implements ExpenseRepository {
  final categoryCollection = FirebaseFirestore.instance.collection('category');
  final expenseCollection = FirebaseFirestore.instance.collection('expense');

  @override
  Future<void> createCategory(Category category) async {
    try {
      await categoryCollection
          .doc(category.categoryId)
          .set(category.toEntity().toDocument());
      print('Category created successfully');
    } catch (e) {
      log('Error creating category: ${e.toString()}');
      rethrow;
    }
  }



  @override
  Future<List<Category>> getCategory() async {
    try {
      return await categoryCollection
          .get()
          .then((value) => value.docs.map((e) => Category.fromEntity(CategoryEntity.fromDocument(e.data()))).toList());
    } catch (e) {
      log('Error getting categories: ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<void> createExpense(Expense expense) async {
    try {
      await expenseCollection
          .doc(expense.expenseId)
          .set(expense.toEntity().toDocument());
      print('Expense created successfully');
    } catch (e) {
      log('Error creating expense: ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<List<Expense>> getExpenses() async {
    try {
      return await expenseCollection
          .get()
          .then((value) => value.docs.map((e) => Expense.fromEntity(ExpenseEntity.fromDocument(e.data()))).toList());
    } catch (e) {
      log('Error getting expense: ${e.toString()}');
      rethrow;
    }
  }
}
