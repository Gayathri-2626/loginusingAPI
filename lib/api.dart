import 'package:http/http.dart' as http;
import 'dart:convert';

Future loginUser(String email, String password) async{
 String url ='http://testapi.pixalive.me/api/login/';
  final response = await http.post(Uri.parse(url),
  headers: {"Accept": "Application/json"},
    body: {'email':email, 'password':password}
  );
  var convertedDatatojson = jsonDecode(response.body);
  return convertedDatatojson;
}