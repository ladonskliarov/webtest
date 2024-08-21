// LSkliarov 20 August 2024 19:16 UTC+2
// Class for getting data from API

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/node.dart';

class DataService {
  static Future<dynamic>? getData(String url) async {
    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        debugPrint(response.data['data'].toString());

        final List<APINode> result =
            (response.data['data'] as List).map((e) => APINode.fromJson(e as Map<String, dynamic>)).toList();

        return result;
      } else if (response.statusCode == 429) {
        return 'Too many requests';
      } else if (response.statusCode == 500) {
        return 'Internal Server Error';
      }
    } catch (e) {
      debugPrint('Exception: ${e.toString()}');
    }
  }

  static Future<dynamic> postData(String url) async {
    try {
      final response = await Dio().post(url);

      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
        return response.data;
      } else if (response.statusCode == 429) {
        return 'Too many requests';
      } else if (response.statusCode == 500) {
        return 'Internal Server Error';
      }
    } catch (e) {
      debugPrint('Exception: ${e.toString()}');
    }
  }
}
