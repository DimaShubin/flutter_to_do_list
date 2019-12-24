import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/BLoC/bloc_provider.dart';
import 'package:to_do_list/BLoC/task_bloc.dart';
import 'package:to_do_list/components/list_completed.dart';
import 'package:to_do_list/components/list_tile.dart';
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
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Text('Select lot');
                  case ConnectionState.waiting:
                    return Text('Awaiting bids...');
                  case ConnectionState.active:
                    print(snapshot.data);
                    return Text('\$${snapshot.data}');
                  case ConnectionState.done:
                    return Text('\$${snapshot.data} (closed)');
                }
                return null;
              },
            ),
          ),
          TasksWidget(items: items),
          CompletedTasksContainer(),

//          buildCompletedList(),
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

class TasksWidget extends StatelessWidget {
  const TasksWidget({
    Key key,
    @required this.items,
  }) : super(key: key);

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final key = items[index];
          return TaskTile(
            taskTitle: 'task 1',
            isChecked: false,
            checkboxCallback: () {},
            key: Key(key),
          );
        },
        separatorBuilder: (context, index) => Divider(
              color: Colors.white,
              height: 2.0,
            ),
        itemCount: items.length);
  }
}
