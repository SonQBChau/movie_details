

import 'package:flutter/material.dart';

class StoryLine extends StatelessWidget {
  StoryLine(this.storyLine);
  final String storyLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Story Line'),
      ],
    );
  }
}
