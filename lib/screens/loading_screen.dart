import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;
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
    getLocation();
    super.initState();
  }

  void getLocation() async {
   LocationClass locationClass = LocationClass();
   await locationClass.getCurrentLocation();
   print(locationClass.latitude);
   print(locationClass.longitude);
   latitude = locationClass.latitude;
   longitude = locationClass.longitude;
    setState(() {});
  }

  void getData() async{
    final response = await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=${urls.getApiKey()}"));
    print(response.body);
    print(response.statusCode);

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){getData();}, child: SizedBox()),
      ),
    );
  }
}
