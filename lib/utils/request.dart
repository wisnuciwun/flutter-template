import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:triscoproduction/constants/constants.dart';
import 'package:triscoproduction/views/components/index.dart';

Future<http.Response> requestApi({
  required context,
  String method = 'GET',
  String endpoint = '',
  Map<String, dynamic>? data,
  int maxRetries = 2,
}) async {
  var url = Uri.http(apiHost, "/api$endpoint");
  final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
  // var bearer = await LocalData.readSecureData(bearerToken);

  late http.Response response;

  for (var retry = 0; retry < maxRetries; retry++) {
    try {
      if (method == 'GET') {
        response = await http.get(url, headers: {
          ...headers,
          // 'Authorization': "Bearer $bearer"
        }).timeout(const Duration(seconds: 15));
      } else if (method == 'POST') {
        response = await http
            .post(url,
                headers: {
                  ...headers,
                  //  'Authorization': "Bearer $bearer"
                },
                body: json.encode(data))
            .timeout(const Duration(seconds: 15));
      } else if (method == 'PUT') {
        response = await http
            .put(url,
                headers: {
                  ...headers,
                  //  'Authorization': "Bearer $bearer"
                },
                body: json.encode(data))
            .timeout(const Duration(seconds: 15));
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return response;
      }
      // else {
      //   print('Request failed with status: ${response.statusCode}');
      //   print('Response body: ${response.body}');
      // }
    } catch (e) {
      // print('Error during request: $e');
    }

    await Future.delayed(const Duration(seconds: 2));
  }

  // popUp(
  //     context: context,
  //     text: 'Failed to complete the request after $maxRetries attempts',
  //     title: 'Oops!',
  //     icon: Icons.sentiment_very_dissatisfied);

  throw Error();
}
