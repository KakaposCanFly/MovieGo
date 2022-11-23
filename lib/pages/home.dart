import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String posterURL = 'https://image.tmdb.org/t/p/w500/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg';
  late String movieTitle = 'Blade Runner 2049';

  Map apidata = {}; // stores the title and poster url to initialize the variables above


  @override
  Widget build(BuildContext context) {


    final CollectionReference _topmovies = FirebaseFirestore.instance.collection('topmovies');
    print(_topmovies.snapshots());

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
      body: StreamBuilder(
        stream: _topmovies.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          return Column(
            children: [
              Image(image: NetworkImage(
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
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/');
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
                        onPressed: () async {
                          int newmovie = 1;
                          // print(documentSnapshot['title']);
                          for (var i = 0; i < streamSnapshot.data!.docs.length; i++) {
                            if (streamSnapshot.data!.docs[i]['title'] == movieTitle) {
                              await _topmovies.doc(streamSnapshot.data!.docs[i].id).update({"title": movieTitle, "score": streamSnapshot.data!.docs[i]['score']+1});
                              newmovie = 0;
                            }
                          }
                          if (newmovie == 1) {
                            await _topmovies.add({"title": movieTitle, "score": 1});
                            newmovie = 0;
                          }
                          Navigator.pushReplacementNamed(context, '/');
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
          );
        }

      ),

    );
  }
}
