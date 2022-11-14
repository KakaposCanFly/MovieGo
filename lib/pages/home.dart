import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String posterURL = 'https://image.tmdb.org/t/p/w500/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg';
  late String movieTitle = 'Blade Runner 2049';

  Map apidata = {};

  @override
  Widget build(BuildContext context) {

    apidata = ModalRoute.of(context)!.settings.arguments as Map;
    movieTitle = apidata["title"];
    posterURL = 'https://image.tmdb.org/t/p/w500${apidata["poster_url"]}';

    // print('https://image.tmdb.org/t/p/w500${apidata["poster_url"]}');
    // print(apidata["title"]);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('MovieGo'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/scoreboard');
              },
              child: Icon(
                  Icons.leaderboard_sharp),
            )
          ),
        ],
      ),
      body: Column(
        children: [
          Image(image: NetworkImage(
              //'https://m.media-amazon.com/images/M/MV5BNzA1Njg4NzYxOV5BMl5BanBnXkFtZTgwODk5NjU3MzI@._V1_.jpg'
              posterURL
            )
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(
                    onPressed: () async {      //api.themoviedb.org/3/movie/550?api_key=832757608aeb36e2f0ad08dcf9b3bfd4
                      var url = Uri.https('api.themoviedb.org', '/3/movie/550', {'api_key' : '832757608aeb36e2f0ad08dcf9b3bfd4'});
                      var response = await http.get(url);
                      print('URL: $url');
                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');
                      print('You did not like this movie');
                    },
                    color: Colors.red,
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(),
                    child: const Icon(
                      Icons.thumb_down_sharp,
                      color: Colors.white,
                      size: 60.0,
                    ),
                  ),
                  Text(
                    movieTitle,      // Filler data
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0
                    ),

                  ),
                  MaterialButton(
                    onPressed: () async {      //api.themoviedb.org/3/movie/550?api_key=832757608aeb36e2f0ad08dcf9b3bfd4
                      var url = Uri.https('api.themoviedb.org', '/3/movie/550', {'api_key' : '832757608aeb36e2f0ad08dcf9b3bfd4'});
                      var response = await http.get(url);
                      print('URL: $url');
                      print('Response status: ${response.statusCode}');
                      print('Response body: ${response.body}');
                      print('You liked this movie');
                    },
                    color: Colors.green,
                    padding: EdgeInsets.all(8.0),
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.thumb_up_sharp,
                      color: Colors.white,
                      size: 60.0,
                    ),
                  ),
                ],
              ),
            ),
          )

        ],
      ),

    );
  }
}
