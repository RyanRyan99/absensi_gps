import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, double> currentLocation = new Map();
  StreamSubscription<Map<String, double>> locationSubscription;

  var location = new Location();
  String error;

  @override
  void initState() {
    currentLocation['latitude'] = 0.0;
    currentLocation['longitude'] = 0.0;
    initPlatformState();
    location.onLocationChanged().listen((LocationData currentLocation){
      print(currentLocation.latitude);
      print(currentLocation.longitude);
      currentLocation = currentLocation;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text("")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> initPlatformState() async {
    Map<String, double> MyLocation;
    try{
      MyLocation = (await location.getLocation()) as Map<String, double>;
      error = "";
    } on PlatformException catch(e){
      if(e.code == 'PERMISSION_DENIED')
        error = 'Permission Denied';
      else if(e.code == 'PERMISSION_DENIED_NEVER_ASK')
        error = 'Permission denied - please ask user to enable';
      MyLocation = null;
    }
    setState(() {
      currentLocation = MyLocation;
    });
  }
}
