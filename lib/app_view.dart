import 'package:expense_repository/expense_repository.dart';
import 'package:expense_tracker/screens/Home/Blocs/get_expenses_bloc/get_expenses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/Home/Views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          background: Color(0xF5F5F5FF),
          onBackground: Colors.black,
          primary: Color.fromRGBO(61, 82, 161, 1),
          secondary: Color.fromRGBO(134, 151, 195, 1),
          tertiary: Color.fromRGBO(238, 232, 246, 1),
          outline: Colors.grey,
        ),
      ),
      home: BlocProvider(
        create: (context) => GetExpensesBloc(
          FirebaseExpenseRepo()
        )..add(GetExpenses()),
        child: const HomeScreen(),
      ),
    );
  }
}
