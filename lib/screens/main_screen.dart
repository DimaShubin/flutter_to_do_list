import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/BLoC/bloc_provider.dart';
import 'package:to_do_list/BLoC/task_bloc.dart';
import 'package:to_do_list/components/list_completed.dart';
import 'package:to_do_list/components/task_list.dart';
import 'package:to_do_list/components/title_widget.dart';
import 'package:to_do_list/screens/add_tast_screen.dart';

class MainScreen extends StatelessWidget {
  final items = List<String>.generate(5, (i) => "Item ${i + 1}");

  @override
  Widget build(BuildContext context) {
    final TaskBloc bloc = BlocProvider.of<TaskBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('TO DO LIST'),
        centerTitle: true,
        backgroundColor: Color(0xFF666666),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TitleWidget(
              title: 'Outstanding',
            ),
          ),
          Container(
            child: StreamBuilder(
              stream: bloc.stream,
              initialData: bloc.tasks,
              builder: (context, snapshot) {
                final results = snapshot.data;
                if (results == null) {
                  return Center(
                    child: Text('List is empty!'),
                  );
                }
                if (results.isEmpty) {
                  return Center(
                    child: Text('No Results'),
                  );
                }
                return TasksWidget(items: results);
              },
            ),
          ),
//          TasksWidget(items: items),
          CompletedTasksContainer(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => AddTask()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
