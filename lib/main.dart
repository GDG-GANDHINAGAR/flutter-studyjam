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

class Home extends StatelessWidget {
  // Widget buildWeatherDisplay() {
  //   return Row(
  //     children: <Widget>[
  //       image
  //     ],
  //   );
  // }
  Widget buildCityDisplay() {
    return Column(
      children: <Widget>[
        Text(
          'Newyork',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 35.0,
              fontWeight: FontWeight.w200),
        ),
        Text(
          'Today',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20.0,
              fontWeight: FontWeight.w300),
        ),
        PopupMenuButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Noon',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300),
              ),
              RotatedBox(
                quarterTurns: -1,
                child: Icon(Icons.arrow_back_ios,size: 10.0,)
              ),
              
            ],
          ),
          itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text('Morning'),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text('Noon'),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Text('Evening'),
                )
              ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: new IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Color(0xff343434),
        ),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildCityDisplay(),
          buildCityDisplay(),
          buildCityDisplay(),
        ],
      ),
    );
  }
}
