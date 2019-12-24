import 'package:flutter/material.dart';
import 'package:to_do_list/model/task_item.dart';
import 'list_tile.dart';

class TasksWidget extends StatelessWidget {
  const TasksWidget({
    Key key,
    @required this.items,
  }) : super(key: key);

  final List<Task> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = items[index];

          return TaskTile(
            taskTitle: item.label,
            isChecked: item.isDone,
            checkboxCallback: () {},
            //            key: Key(key),
          );
        },
        separatorBuilder: (context, index) => Divider(
              color: Colors.white,
              height: 2.0,
            ),
        itemCount: items.length);
  }
}
