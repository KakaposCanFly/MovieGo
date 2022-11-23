import 'package:flutter/material.dart';
import 'package:moviego/pages/home.dart';
import 'package:moviego/pages/scoreboard.dart';
import 'package:moviego/pages/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  return runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/scoreboard': (context) => ScoreBoard(),
    },
  ));
}
