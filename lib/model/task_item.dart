import 'package:flutter/cupertino.dart';

class Task {
  final String label;
  final String descr;
  bool isDone;

  Task({@required this.label, this.descr, this.isDone});
}
