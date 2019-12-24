import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/BLoC/task_bloc.dart';

import '../constants.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final titleController = TextEditingController();
  final descrController = TextEditingController();
  final bloc = TaskBloc();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    descrController.dispose();
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Color(0xFF000000),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: titleController,
                    decoration: kInputDecoration.copyWith(labelText: 'Title'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: TextField(
                      controller: descrController,
                      decoration: kInputDecoration.copyWith(
                          labelText: 'Decor'
                              'ation'),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: () {
                var title = titleController.text.toString();
                var descr = descrController.text.toString();
                bloc.addToList.add({'title': title, 'descr': descr});
              },
            )
          ],
        ),
      ),
    );
  }
}
