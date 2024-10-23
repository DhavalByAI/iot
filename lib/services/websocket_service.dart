import 'dart:convert';
import 'dart:developer';
import 'package:iot/services/api_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../models/device_model.dart';

class WebSocketService {
  static WebSocketChannel? channel;

  static void connect(List<DeviceModel> deviceModels, Function(List<DeviceModel>) onDeviceModelsUpdated) {
    const token = ApiService.token;
    const webSocketUrl = 'wss://broker.smarden.tech:8090/?token=';

    channel = WebSocketChannel.connect(Uri.parse('$webSocketUrl$token'));
    channel?.stream.listen(
      (message) {
        log("WebSocket connected successfully");
        // Process WebSocket message and pass the updated deviceModels
        final updatedModels = processWebSocketMessage(message, deviceModels);
        onDeviceModelsUpdated(updatedModels); // Trigger UI update
      },
      onDone: () => log("WebSocket connection closed."),
      onError: (error) => log("WebSocket connection error: $error"),
    );
  }

  static List<DeviceModel> processWebSocketMessage(String message, List<DeviceModel> deviceModels) {
    log("Received WebSocket message: $message");
    final parts = message.split('::');

    if (parts.length > 1) {
      final payload = jsonDecode(parts[1]);
      final params = payload['data']['params'];

      for (var device in deviceModels) {
        for (var switchData in device.nodes) {
          if (params.containsKey(switchData.attr)) {
            switchData.isOn = params[switchData.attr] == 0; // 0 -> ON, 1 -> OFF
          }
        }
      }
    }

    return deviceModels; // Return updated models
  }

  static void dispose() {
    channel?.sink.close();
  }
}
