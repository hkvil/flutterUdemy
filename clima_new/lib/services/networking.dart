import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{
  final String url;

  NetworkHelper(this.url);

  Future<dynamic> getData() async{

    var data,decodedData;
    var response = await http.get(Uri.parse(url));

    if(response.statusCode==200){
      data=response.body;
      return jsonDecode(data);
    }else{
      print(response.statusCode);
    }

  }
}