import 'package:flutter/material.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

// Please note that having the FabCircularMenu inside a StatefulWidget is only needed if you plan to use the
// GlobalKey to close the menu with the "toggleOpenState" feature.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final fabCircularMenuKey = GlobalKey<FabCircularMenuState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FabCircularMenu(
        key: fabCircularMenuKey,
        child: Container(
          color: Colors.indigo[900],
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(bottom: 256.0),
            child: Text('FAB Circle Menu Example',
                textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 36.0)),
          )),
        ),
        ringColor: Colors.white30,
        options: <Widget>[
          IconButton(
              icon: Icon(Icons.widgets),
              onPressed: () {
                print('First option chosen (the menu will close and a callback called..)');
                fabCircularMenuKey.currentState.toggleOpenState(onEndCloseAnimation: () {
                  print('The menu closing animation ended.');
                });
              },
              iconSize: 48.0,
              color: Colors.greenAccent),
          IconButton(
              icon: Icon(Icons.widgets),
              onPressed: () {
                print('Second option choosen (the menu will close).');
                fabCircularMenuKey.currentState.toggleOpenState();
              },
              iconSize: 48.0,
              color: Colors.green),
          IconButton(
              icon: Icon(Icons.widgets),
              onPressed: () {
                print('Third option chosen');
              },
              iconSize: 48.0,
              color: Colors.white),
          IconButton(
              icon: Icon(Icons.widgets),
              onPressed: () {
                print('Fourth option choosen');
              },
              iconSize: 48.0,
              color: Colors.white),
        ],
      ),
    );
  }
}
