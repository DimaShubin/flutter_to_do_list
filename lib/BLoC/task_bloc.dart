import 'dart:async';
import 'package:to_do_list/model/task_item.dart';

import 'bloc.dart';

class TaskBloc implements Bloc {
  List<Task> _tasks = [
    Task(label: 'default task', descr: 'default descr', isDone: false),
    Task(label: 'default task 2', descr: 'default descr 2', isDone: false)
  ];
  List<Task> get tasks => _tasks;

  StreamController _taskController = StreamController<List<Task>>.broadcast();
  StreamSink<List> get _inAdd => _taskController.sink;
  Stream<List> get stream => _taskController.stream;

  StreamController _actionController = StreamController();
  StreamSink get addToList => _actionController.sink;

  TaskBloc() {
    _actionController.stream.listen(addTask);
  }

  void addTask(data) {
    _tasks.add(Task(
      label: '${data["title"]}',
      descr: '${data["descr"]}',
      isDone: false,
    ));

    _inAdd.add(_tasks);
  }

  void removeTask(name) {
    _tasks.removeWhere((item) => item.label == name);
  }

  void updateTask(data) {
    var checkbox = _tasks.where((task) => task.label == data);
    checkbox.first.isDone = !checkbox.first.isDone;
    _inAdd.add(_tasks);
    taskComplete();
  }

  void taskComplete() {
    var completed = _tasks.where((task) => task.isDone == true);
    print(completed);
  }

  @override
  void dispose() {
    _taskController.close();
    _actionController.close();
  }
}
