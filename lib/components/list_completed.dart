import 'package:flutter/material.dart';

import 'list_tile.dart';
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
              TaskTile(
                isChecked: true,
              ),
              Text('2'),
            ],
          ),
        ),
      ],
    );
  }
}
