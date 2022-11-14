import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

final _random = new Random();
int randomid() => 100 + _random.nextInt(6000-100);

class MovieData {

  late int movieid;  // movie id of the movie to be fetched
  late Map data;
  late String movie_title;
  late String poster_path;
  String apikey = '832757608aeb36e2f0ad08dcf9b3bfd4';


  Future <void> getRandomMovie() async {
    //https://api.themoviedb.org/3/search/movie?api_key=832757608aeb36e2f0ad08dcf9b3bfd4&query=blade+runner+2049
    //https://api.themoviedb.org/3/movie/25403?api_key=832757608aeb36e2f0ad08dcf9b3bfd4&language=en-US
    // Make the API request

    do {
      movieid = randomid();
      // movieid = 335984;
      // print(' -- fetching movie with id $movieid ');
      http.Response response = await http.get(Uri.https('api.themoviedb.org', '/3/movie/$movieid', {'api_key' : apikey, 'language' : 'enn-US'}));
      data = jsonDecode(response.body);

    } while (data["success"] != null || data["success"] == false);
    //print(data);
    if(data["adult"] != null){
      // Store the title and poster path to variables (these will be passed to the home screen)
      movie_title = data["original_title"];
      poster_path = data["poster_path"];
      // print(movie_title);
      // print(poster_path);
    }
    else if (data["results"][0]["adults"] != null){
      // Store the title and poster path to variables (these will be passed to the home screen)
      movie_title = data["results"][0]["original_title"];
      poster_path = data["results"][0]["poster_path"];
      // print(movie_title);
      // print(poster_path);
    }

  }

}

