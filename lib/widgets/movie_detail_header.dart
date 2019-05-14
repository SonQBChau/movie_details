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
          Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: ArcBannerImage(movie.bannerUrl),
          ),
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
    var screenWidth = MediaQuery.of(context).size.width;
    return ClipPath(
      clipper: ArcClipper(),
      child: Image.asset(
        bannerUrl,
        width: screenWidth,
        height: 230,
        fit: BoxFit.cover,
      ),
    );
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Poster(movie.posterUrl),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
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
                SizedBox(
                  height: 10,
                ),
                CategoryChip(movie.categories),
              ],
            ),
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
    return Row(children: categories.map((title) => buildChip(title)).toList());
  }

  Container buildChip(String text) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(color: Colors.black87)),
    );
  }
}

/*
GRADE WIDGET
 */
class StarRating extends StatelessWidget {
  StarRating(this.starRating);
  final int starRating;
  List<Widget> starList = [];
  @override
  Widget build(BuildContext context) {
    for (var i = 1; i < 6; i++) {
      var color = i <= starRating ? Colors.red : Colors.black26;
      starList.add(Icon(
        Icons.star,
        color: color,
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: starList,
        ),
        SizedBox(
          height: 5,
        ),
        Text('Grade now', style: TextStyle(color: Colors.black45)),
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
              color: Colors.red, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 5,
        ),
        Text('Ratings', style: TextStyle(color: Colors.black45),),
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
    return ClipRRect(
    borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        posterUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,

      ),
    );
  }
}

/*
ARC CLIPPER WIDGET
*/
class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
