import 'package:flutter/material.dart';

class PhotoScroller extends StatelessWidget {
  PhotoScroller(this.photoUrls);
  final List<String> photoUrls;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Photos',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(height: 10,),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: photoUrls
                  .map<Widget>((photoUrl) => buildPhoto(photoUrl))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  buildPhoto(String photoUrl) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          photoUrl,
          width: 160,
          height: 120,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
