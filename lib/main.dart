import 'package:bmi/home.dart';


import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

     
      theme: ThemeData( 
          primarySwatch: Colors.teal,
          canvasColor: Colors.black,
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w800, color: Colors.white),
            headline2: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.white,)
          ),
      debugShowCheckedModeBanner: false,
      home: const Myhomepage(),
    );
  }
}
