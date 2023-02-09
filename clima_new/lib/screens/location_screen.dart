import 'package:clima_new/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima_new/utilities/constants.dart';
import 'package:clima_new/services/weather.dart';

WeatherModel weatherModel = WeatherModel();

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherData});
  final weatherData;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int temp;
  var condition;
  var city;
  var icon;
  var msg;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherData);
  }
  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData == null){
        temp = 0;
        condition = 0;
        city = '';
        icon = 'Error';
        msg = 'Unable to get data';
        return;
      }
      double temperature = weatherData['main']['temp'];
      temp = temperature.toInt();
      condition = weatherData['weather'][0]['id'];
      city = weatherData['name'];
      icon = weatherModel.getWeatherIcon(condition);
      msg = '${weatherModel.getMessage(temp)} in $city';
      print(temp);
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async{
                      var weatherData = await WeatherModel().getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedCity = await Navigator.push(context,MaterialPageRoute(builder: (context)=>CityScreen()));
                      if(typedCity != null) {
                        var weatherData = await weatherModel.getCityWeather(typedCity);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$icon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "${weatherModel.getMessage(temp)} in $city",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
