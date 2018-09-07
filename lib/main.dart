import 'package:flutter/material.dart';
import 'package:flutter_study_jam_gandhinagar/Detail.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Movie App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Home(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/Detail": (BuildContext context) => Detail(),
      },
    );
  }
}

class Home extends StatefulWidget{
  HomeState createState()=>  HomeState();
}


class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context){
    return Container();
  }
}