import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
  home: MainScreen()
));

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('MovieGo'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Image(image: NetworkImage('https://m.media-amazon.com/images/M/MV5BNzA1Njg4NzYxOV5BMl5BanBnXkFtZTgwODk5NjU3MzI@._V1_.jpg')),
          Container(
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
                  'Blade Runner 2049',      // Filler data
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
          )

        ],
      ),

    );
  }
}

//
// class DataFromAPI extends StatefulWidget {
//   @override
//   _DataFromAPIState createState() => _DataFromAPIState();
// }
//
// class _DataFromAPIState extends State<DataFromAPI> {
//   getMovieData() async {
//     var response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'posts'));
//     var jsonData = jsonDecode(response.body);
//     print(jsonData);
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       child: Card(child: FutureBuilder(
//         future: getMovieData(),
//         builder: (context, snapshot){
//           if(snapshot.data == null){
//             return Container(child: Center(child: Text('Loading...'),),);
//           }
//           else return Text
//           },
//         )
//       )
//     );
//   }
// }