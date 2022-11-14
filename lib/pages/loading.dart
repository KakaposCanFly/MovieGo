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
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading screen'),
    );
  }
}
