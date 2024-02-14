import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> getdata() async {
    final urllink = "https://randomuser.me/api/?results=100";

    final response = await http.get(Uri.parse(urllink));

    final Json = jsonDecode(response.body);
    print("fetch completed");
    return Json;
  }
}
