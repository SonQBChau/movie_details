import 'package:flutter/material.dart';
import 'package:movie_details/models/movie.dart';

class MovieDetailHeader extends StatelessWidget {
  MovieDetailHeader(this.movie);
  Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Image.asset('images/banner.png'),

          Row(
            children: <Widget>[
              Container(
                width: 140,
                height: 180,
                child: Image.asset('images/poster.png'),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('The Secret Life of Pets', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('8.0', style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.w300),),
                          Text('Ratings'),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Colors.red,),
                              Icon(Icons.star, color: Colors.red,),
                              Icon(Icons.star, color: Colors.red,),
                            ],
                          ),
                          Text('Grade now'),
                        ],
                      ),
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      Text('Animation'),
                      Text('Comedy'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
