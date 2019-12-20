import 'package:flutter/material.dart';
import '../constants.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  TitleWidget({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        color: kColorMutedText,
      ),
    );
  }
}
