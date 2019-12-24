import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_list/BLoC/bloc_provider.dart';
import 'package:to_do_list/BLoC/task_bloc.dart';

import '../constants.dart';

class TaskTile extends StatelessWidget {
  bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Key key;

  TaskTile({this.taskTitle, this.isChecked, this.checkboxCallback, this.key});

  @override
  Widget build(BuildContext context) {
    final TaskBloc bloc = BlocProvider.of<TaskBloc>(context);
    return Dismissible(
      onDismissed: (DismissDirection direction) {
        bloc.removeTask(this.taskTitle);
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("$key dismissed"),
          behavior: SnackBarBehavior.floating,
        ));
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: kColorDarkGray,
        padding: EdgeInsets.symmetric(horizontal: 15),
        alignment: AlignmentDirectional.centerEnd,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 25.0,
        ),
      ),
      key: UniqueKey(),
      child: Container(
        color: Color(0xFFd3d3d3),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 16.0),
          title: Text('$taskTitle'),
          trailing: Checkbox(
            value: isChecked,
            onChanged: (val) {
              bloc.updateTask(this.taskTitle);

              if (this.isChecked == false) {
                Timer(
                    Duration(milliseconds: 400),
                    () => Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Task completed!"),
                          behavior: SnackBarBehavior.floating,
                        )));
              }
            },
          ),
        ),
      ),
//      confirmDismiss: (DismissDirection direction) async {},
    );
  }
}
