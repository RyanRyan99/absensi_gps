import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:absensigps/geolocation.dart';
import 'package:geolocator/geolocator.dart';

class GeoLocation extends StatefulWidget {
  @override
  _GeoLocationState createState() => _GeoLocationState();
}

class _GeoLocationState extends State<GeoLocation> {
  String _locationMessage = "";
  void _getCurrentLocation() async {
    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _locationMessage = "${position.latitude}, ${position.longitude}";
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_locationMessage),
                RaisedButton(
                  color: Colors.red,
                  onPressed: (){_getCurrentLocation();},
                  child: Text("Get Posisi", style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
