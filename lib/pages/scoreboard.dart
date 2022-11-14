import 'package:flutter/material.dart';
import 'entry.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {

  List<Entry> movienames = [
    Entry(title: 'Blade Runner 2049', score: 50),
    Entry(title: 'Interstellar', score: 30),
    Entry(title: 'Gladiator', score: 20),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Top Movies'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: movienames.map((movie) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget> [
            Text(
              '${movie.title}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0
              ),
            ),
            Text(
              '${movie.score}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32.0
              ),
            ),
          ]
        )).toList()
      )
    );
  }
}
