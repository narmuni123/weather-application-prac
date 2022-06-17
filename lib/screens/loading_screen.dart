import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:weather_app/utilities/urls.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longitude;

  Urls urls = Urls();

  @override
  void initState() {
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    LocationClass locationClass = LocationClass();
    await locationClass.getCurrentLocation();
    print(locationClass.latitude);
    print(locationClass.longitude);
    latitude = locationClass.latitude;
    longitude = locationClass.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=${urls.getApiKey()}");

    // var networkData = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LocationScreen();
        },
      ),
    );
    setState(() {});
  }

  void getData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              getData();
            },
            child: SizedBox()),
      ),
    );
  }
}
