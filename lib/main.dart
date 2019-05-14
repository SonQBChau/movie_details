import 'package:flutter/material.dart';
import 'package:movie_details/api/movie_api.dart';
import 'package:movie_details/screens/movie_detail_page.dart';

/*
https://iirokrankka.com/2017/09/12/from-design-to-flutter-movie-details-page/
 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: const Color(0xFFFF5959),
      ),
      home: MovieDetailsPage(testMovie),
    );
  }
}