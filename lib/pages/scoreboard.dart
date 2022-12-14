import 'package:flutter/material.dart';
import 'entry.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key? key}) : super(key: key);



  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {


  final CollectionReference _topmovies = FirebaseFirestore.instance.collection('topmovies');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Top Movies'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: StreamBuilder(
        stream: _topmovies.orderBy('score', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.only(top: 4),
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                return Card(
                  color: Colors.grey[850],
                  margin: const EdgeInsets.all(6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SizedBox(
                            width: 290,
                            child: Text(
                              documentSnapshot['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            documentSnapshot['score'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0
                            ),
                          ),
                        ),
                      ]
                  )
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
