import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '0b79519435774a240d60dee0ecaf3426';

void getData()async{
  String url = 'https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1';
  var response = await http.get(Uri.parse(url));
  var data = response.body;
  var decodedData = jsonDecode(data);
  var temp = jsonDecode(data)['main']['temp'];
  var condition = jsonDecode(data)['weather'][0]['id'];
  var city = jsonDecode(data)['name'];
  print(response.body);
  print("city : $city");
  print("temperature : $temp");
  print("condition : $condition");
}

main(){
  getData();
}