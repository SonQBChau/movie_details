import 'package:flutter/material.dart';
import 'package:movie_details/models/movie.dart';
import 'package:movie_details/widgets/movie_detail_header.dart';
import 'package:movie_details/widgets/photo_scroller.dart';
import 'package:movie_details/widgets/story_line.dart';


class MovieDetailsPage extends StatelessWidget {
  MovieDetailsPage(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetailHeader(movie),
            StoryLine(movie.storyline),
            PhotoScroller(movie.photoUrls),
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