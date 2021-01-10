import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocate/main.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double dlatitudeData;
  double dlongitudeData;

  @override
  void initState(){
    super.initState();
    getCurrentLocation();
  }

   getCurrentLocation() async{
    final geoposition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState((){
      dlatitudeData = geoposition.latitude;
      dlongitudeData = geoposition.longitude;

      //String slatitudeData = dlatitudeData.toString();
      //String slognitudeData = dlongitudeData.toString();
    });
   }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(dlatitudeData.toString()),
          Text(dlongitudeData.toString()),
        ],
      ),
    );
  }
}

