import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/device_model.dart';

class ApiService {

  static final Dio dio = Dio();
  static const String token   = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoidXNlciIsIm9yZ0lkIjoxLCJwcm9maWxlSWQiOjEsIm5hbWUiOiJEZW1vIEFjY291bnQgIiwidXNlcklkIjo0LCJsZXZlbCI6IjEwIiwiY2xpZW50Ijp7ImlkIjoxfSwiaWF0IjoxNzI5MzQ1OTMzLCJleHAiOjE3NDQ4OTc5MzN9.B1NZM_IfyPNNVPowsaw3TOleZrUvelIGCmYnUMRZPTM';
  static const String apiUrl1 = 'https://api.smarden.tech/core/v1/segment/1/group/63/device';
  static const String apiUrl2 = 'https://api.smarden.tech/core/v1/segment/60/group/91/device-status';

  static Future<List<DeviceModel>> fetchDeviceApi() async {
    try {
      final response = await dio.get(apiUrl1, options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        log('fetchDeviceApi Sucessfully :: ${response.statusCode}');
        return (response.data['data'] as List).map((deviceJson) => DeviceModel.fromJson(deviceJson)).toList();
      }
    } catch (e) {
      log('Error fetching devices: $e');
    }
    return [];
  }

  static Future<void> fetchDeviceStatusApi() async {
    try {
      await dio.get(apiUrl2, options: Options(headers: {'Authorization': 'Bearer $token'}));
      log('Device status fetched successfully.');
    } catch (e) {
      log('Error fetching device status: $e');
    }
  }
}
