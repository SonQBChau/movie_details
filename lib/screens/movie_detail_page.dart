import 'package:flutter/material.dart';
import 'package:movie_details/models/movie.dart';


class MovieDetailsPage extends StatelessWidget {
  MovieDetailsPage(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
//            MovieDetailHeader(movie),
//            Padding(
//              padding: const EdgeInsets.all(20.0),
//              child: Storyline(movie.storyline),
//            ),
//            PhotoScroller(movie.photoUrls),
//            SizedBox(height: 20.0),
//            ActorScroller(movie.actors),
//            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}