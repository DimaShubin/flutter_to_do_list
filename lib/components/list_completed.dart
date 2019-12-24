import 'package:flutter/material.dart';
import 'package:to_do_list/BLoC/bloc_provider.dart';
import 'package:to_do_list/BLoC/task_bloc.dart';
import 'package:to_do_list/components/task_list.dart';

import 'title_widget.dart';

class CompletedTasksContainer extends StatefulWidget {
  @override
  _CompletedTasksContainerState createState() =>
      _CompletedTasksContainerState();
}

class _CompletedTasksContainerState extends State<CompletedTasksContainer> {
  bool _isDropOpen = false;
  @override
  Widget build(BuildContext context) {
    final TaskBloc bloc = BlocProvider.of<TaskBloc>(context);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TitleWidget(
                title: 'Completed',
              ),
              RawMaterialButton(
                child: Text((_isDropOpen ? 'Hide' : 'Show').toUpperCase()),
                textStyle:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                padding: EdgeInsets.all(0),
                constraints: BoxConstraints(minWidth: 10.0, minHeight: 36.0),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {
                  setState(() {
                    _isDropOpen = !_isDropOpen;
                  });
                },
              ),
            ],
          ),
        ),
        AnimatedOpacity(
          opacity: _isDropOpen ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Column(
            children: <Widget>[
              StreamBuilder(
                stream: bloc.stream,
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
