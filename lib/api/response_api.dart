import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sample_project/model/response_model.dart';

class ResponseApi {
  Future<Response?> getResponseData() async {
    var url = Uri.parse(
        'https://vpic.nhtsa.dot.gov/api/vehicles/getallmakes?format=json');
    try {
      final response = await http.get(
        url,
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print(jsonResponse);
        return Response.fromJson(jsonResponse);
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }
    } on Error catch (err) {
      print("error: $err");
      return null;
    }
  }
}
