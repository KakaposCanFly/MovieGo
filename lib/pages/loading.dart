import 'package:flutter/material.dart';
import 'package:moviego/services/movie_data.dart';

class Loading extends StatefulWidget {

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getMovieData() async {
    MovieData instance = MovieData();
    await instance.getRandomMovie();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'title': instance.movie_title,
      'poster_url': instance.poster_path,
    });
  }

  @override
  Widget build(BuildContext context) {
    getMovieData();
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator()),
          backgroundColor: Colors.grey[900],
    );
  }
}
