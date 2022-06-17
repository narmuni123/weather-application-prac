import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
   LocationClass locationClass = LocationClass();
   await locationClass.getCurrentLocation();
   print(locationClass.latitude);
   print(locationClass.longitude);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(),
    );
  }
}
