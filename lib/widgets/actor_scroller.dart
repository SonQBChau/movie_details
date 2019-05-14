import 'package:flutter/material.dart';
import 'package:movie_details/models/actor.dart';

class ActorScroller extends StatelessWidget {
  ActorScroller(this.actors);
  List<Actor> actors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Actor',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children:
                  actors.map<Widget>((actor) => _buildAvatar(actor)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  _buildAvatar(Actor actor) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(actor.avatarUrl),
          ),
          SizedBox(
            height: 3,
          ),
          Text(actor.name),
        ],
      ),
    );
  }
}
