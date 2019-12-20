import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/components/list_tile.dart';
import 'package:to_do_list/components/title_widget.dart';
import 'package:to_do_list/screens/add_tast_screen.dart';

import '../constants.dart';

class MainScreen extends StatelessWidget {
  final items = List<String>.generate(5, (i) => "Item ${i + 1}");
  @override
  Widget build(BuildContext context) {
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
          _myListView(context),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TitleWidget(
                  title: 'Completed',
                ),
                RawMaterialButton(
                  child: Text('Show'.toUpperCase()),
                  textStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  padding: EdgeInsets.all(0),
                  constraints: BoxConstraints(minWidth: 10.0, minHeight: 36.0),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                  todo: implement show/hide func
                  onPressed: () => print('show btn'),
                )
              ],
            ),
          ),
//          buildCompletedList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO: add function "createNewTask()"
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) => AddTask()));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.black87,
      ),
    );
  }

  Widget _myListView(BuildContext context) {
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

  Widget buildCompletedList() {}
}
