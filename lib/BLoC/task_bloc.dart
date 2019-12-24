import 'dart:async';
import 'package:to_do_list/model/task_item.dart';

import 'bloc.dart';

class TaskBloc implements Bloc {
  List<Task> _tasks = [];

  StreamController _taskController = StreamController<List<Task>>();
  StreamSink<List> get _inAdd => _taskController.sink;
  Stream<List> get stream => _taskController.stream;

  StreamController _actionController = StreamController();
  StreamSink get addToList => _actionController.sink;

  TaskBloc() {
    _actionController.stream.listen(addTask);
  }

  void addTask(data) {
    print(data);
    _tasks.add(Task(label: '$data[title]', descr: '$data[descr]'));
    _inAdd.add(_tasks);
  }

  @override
  void dispose() {
    _taskController.close();
    _actionController.close();
  }
}
