import 'dart:convert';
import 'dart:io';

import 'package:bloc_usage/model/base_model.dart';
import 'package:http/http.dart' as http;

class NetworkManager {
  Future get({required String pathQuery, required BaseModel model}) async {
    var baseUrl = "https://jsonplaceholder.typicode.com/$pathQuery";

    final response = await http.get(Uri.parse(baseUrl));
    // print(response.body.toString());
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonBody = jsonDecode(response.body) as List;
        return jsonBody.map((e) => model.fromJson(e)).toList();
      default:
        throw NetworkError(response.statusCode.toString(), response.body);
    }
  }
}

class NetworkError implements Exception {
  final String statusCode;
  final String message;

  NetworkError(this.statusCode, this.message);
}
