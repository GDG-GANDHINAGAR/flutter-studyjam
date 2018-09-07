import 'package:flutter/material.dart';

void main() => runApp(new MyApp());
//  TODO use InheritedWidget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Weather App',
      home: new Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLiGht = true;

  Widget buildWeatherDisplay() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset('assets/images/Sun.png'),
        SizedBox(
          width: 24.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '84°C',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 64.0,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              'Mostly Sunny',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300),
            ),
          ],
        )
      ],
    );
  }

  Widget buildCityDisplay() {
    return Column(
      children: <Widget>[
        Text(
          'Newyork',
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 35.0,
              fontWeight: FontWeight.w300),
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
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 10.0,
                  )),
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
    final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Theme(
        data: _isLiGht ? ThemeData.light() : ThemeData.dark(),
        child: Scaffold(
          key: _drawerKey,
          appBar: new AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: new IconButton(
              icon: Icon(Icons.menu),
              color: Color(0xff343434),
              onPressed: () {
                _drawerKey.currentState.openDrawer();
              },
            ),
          ),
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(_isLiGht ? "Night" : "Day"),
                  leading: Image.asset(
                    'assets/images/Sun.png',
                    width: 24.0,
                    height: 24.0,
                  ),
                  onTap: () {
                    setState(() {
                      _isLiGht = !_isLiGht;
                      Navigator.pop(context);
                    });
                  },
                ),
              ],
            ),
          ),
          body: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      buildCityDisplay(),
                      buildWeatherDisplay(),
                      bottomLayout(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget bottomLayout() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        bottomIconColumn('assets/images/wind.png', "3", "km/h"),
        bottomIconColumn('assets/images/rain.png', "5", "%"),
        bottomIconColumn('assets/images/drizzle.png', "20", "%"),
      ],
    );
  }

  Widget bottomIconColumn(String icon, String txtValue, String indication) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image.asset(
          icon,
        ),
        Text(
          txtValue,
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 24.0),
        ),
        Text(indication),
      ],
    );
  }
}
