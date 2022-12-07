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
  late int loopcheck;
  String apikey = '832757608aeb36e2f0ad08dcf9b3bfd4';


  Future <void> getRandomMovie() async {
    // Make the API request
    loopcheck = 0;            // set the loop condition (change it to 1 when valid object is returned)
    while (loopcheck == 0) {
      movieid = randomid();
      http.Response response = await http.get(Uri.https('api.themoviedb.org', '/3/movie/$movieid', {'api_key' : apikey, 'language' : 'enn-US'}));
      data = jsonDecode(response.body);

      if (data["success"] == null) {
        if(data["poster_path"] != null){
          // Store the title and poster path to variables (these will be passed to the home screen)
          movie_title = data["original_title"];
          poster_path = data["poster_path"];
          loopcheck = 1;
        }
      }
    }
  }
}

