import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Position? position;

  @override
  void initState() {
   getLocation();
    super.initState();
  }
  void getLocation() async{
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                (position == null) ? "Loading" : position!.latitude.toString(),
              ),
              Text(
                (position == null) ? "Loading" : position!.longitude.toString(),
              ),
            ],
          )
        ),
    );
  }
}