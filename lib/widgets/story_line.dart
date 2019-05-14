import 'package:flutter/material.dart';

class StoryLine extends StatelessWidget {
  StoryLine(this.storyLine);
  final String storyLine;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Story Line',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            storyLine,
            style: TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'more',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.red,
              )
            ],
          ),
        ],
      ),
    );
  }
}
