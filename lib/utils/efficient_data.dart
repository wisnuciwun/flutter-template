import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:triscoproduction/utils/local_data.dart';
import 'package:triscoproduction/utils/request.dart';
import 'package:triscoproduction/views/components/index.dart';

efficientApiProcess(
    localDataKey, method, api, context, rxData, data, callback) async {
  try {
    if (localDataKey != null) {
      String rawLocalData = await LocalData.readSecureData(localDataKey);
      dynamic res;

      if (rawLocalData.isNotEmpty) {
        dynamic existingDataMap = jsonDecode(rawLocalData);
        callback(existingDataMap, false);
      } else {
        callback(null, true);
      }

      if (method == 'GET') {
        res = await requestApi(
          method: method,
          endpoint: api,
          context: context,
        );
      } else {
        res = await requestApi(
            method: method, endpoint: api, context: context, data: data);
      }

      if (res.statusCode == 200 || res.statusCode == 201) {
        dynamic dataMap = jsonDecode(res.body);
        if (rawLocalData.isEmpty) {
          callback(dataMap, false);
          await LocalData.writeSecureData(localDataKey, res.body);
        } else if (rawLocalData.isNotEmpty) {
          if (rawLocalData.length.toString() != res.body.length.toString()) {
            callback(dataMap, false);
            await LocalData.writeSecureData(localDataKey, res.body);
          }
        }
      }
    } else {
      var res = await requestApi(
        method: method,
        endpoint: api,
        context: context,
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        Map<String, dynamic> dataMap = jsonDecode(res.body);
        callback(dataMap, false);
      } else {
        popUp(
            context: context,
            title: 'Oops!',
            text: 'Terjadi kesalahan',
            icon: Icons.sentiment_dissatisfied);
      }
    }
  } catch (e) {
    popUp(
        context: context,
        title: 'Oops!',
        text: e.toString(),
        icon: Icons.sentiment_dissatisfied);
    callback(null, false);
  }
}
