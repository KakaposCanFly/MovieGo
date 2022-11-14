import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:moviego/pages/home.dart';
import 'package:moviego/pages/scoreboard.dart';
import 'package:moviego/pages/loading.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/scoreboard': (context) => ScoreBoard(),
  },
));
