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
          ArcBannerImage(movie.bannerUrl),
          MovieInfoRow(movie),
        ],
      ),
    );
  }
}

/*
ARC BANNER WIDGET
 */
class ArcBannerImage extends StatelessWidget {
  ArcBannerImage(this.bannerUrl);
  final String bannerUrl;
  @override
  Widget build(BuildContext context) {
    return Image.asset(bannerUrl);
  }
}

/*
MOVIE INFO WIDGET
*/
class MovieInfoRow extends StatelessWidget {
  MovieInfoRow(this.movie);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      left: 16.0,
      right: 16.0,
      child: Row(
        children: <Widget>[
          Poster(movie.posterUrl),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movie.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: <Widget>[
                  RatingInformation(movie.rating),
                  SizedBox(
                    width: 20,
                  ),
                  StarRating(movie.starRating),
                ],
              ),
              CategoryChip(movie.categories),
            ],
          ),
        ],
      ),
    );

  }
}

/*
CATEGORY CHIP WIDGET
 */
class CategoryChip extends StatelessWidget {
  CategoryChip(this.categories);
  final List<String> categories;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: categories.map((title) => buildChip(title)).toList()
    );
  }

  Container buildChip(String text) {
    return Container(
      margin: EdgeInsets.only(right:10),
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
          decoration: BoxDecoration(
            color:Colors.black12,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(text),
      );
  }
}


/*
GRADE WIDGET
 */
class StarRating extends StatelessWidget {
  StarRating(this.starRating);
  final int starRating;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
          ],
        ),
        Text('Grade now'),
      ],
    );
  }
}

/*
RATING WIDGET
 */
class RatingInformation extends StatelessWidget {
  RatingInformation(this.rating);
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          rating.toString(),
          style: TextStyle(
              color: Colors.red, fontSize: 20, fontWeight: FontWeight.w300),
        ),
        Text('Ratings'),
      ],
    );
  }
}

/*
POSTER WIDGET
 */
class Poster extends StatelessWidget {
  Poster(this.posterUrl);
  final String posterUrl;
  static const POSTER_RATIO = 0.7;

  @override
  Widget build(BuildContext context) {
    double height = 180;
    double width = POSTER_RATIO * height;
    return Container(
      width: width,
      height: height,
      child: Image.asset(posterUrl),
    );
  }
}
