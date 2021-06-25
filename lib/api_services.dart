import 'package:flutter_http_reqres/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class ApiService extends GetxController {
  Future<UserModel?> createUser(String name, String job) async {
    var apiUrl = Uri.parse('https://reqres.in/api/users');

    final response = await http.post(apiUrl, body: {"name": name, "job": job});

    if (response.statusCode == 201) {
      final String responseString = response.body;
      return userModelFromJson(responseString);
    } else {
      return null;
    }
  }
}
