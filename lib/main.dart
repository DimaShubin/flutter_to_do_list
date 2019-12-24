import 'package:flutter/material.dart';
import 'package:to_do_list/screens/main_screen.dart';
import 'package:to_do_list/screens/splash_screen.dart';

import 'BLoC/bloc_provider.dart';
import 'BLoC/task_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<TaskBloc>(bloc: TaskBloc(), child: MainScreen()),
    );
  }
}
