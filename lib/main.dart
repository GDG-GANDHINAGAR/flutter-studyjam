import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Movie App',
      home: new Home(),
      debugShowCheckedModeBanner: false,
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