import 'configs.dart';
import 'device_type.dart';
import 'switch_data.dart';

class DeviceModel {
  final int id;
  final String label;
  final int integrationId;
  final String? commandId;
  final String macAddress;
  final String publishId;
  final DeviceType type;
  final Configs configs;
  final String udfChar1;
  final String? udfChar2;
  final String? udfNum1;
  final bool isInit;
  final List<SwitchData> nodes;

  DeviceModel({
    required this.id,
    required this.label,
    required this.integrationId,
    this.commandId,
    required this.macAddress,
    required this.publishId,
    required this.type,
    required this.configs,
    required this.udfChar1,
    this.udfChar2,
    this.udfNum1,
    required this.isInit,
    required this.nodes,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      id: json['id'],
      label: json['label'],
      integrationId: json['integrationId'],
      commandId: json['commandId'],
      macAddress: json['macAddress'],
      publishId: json['publishId'],
      type: DeviceType.fromJson(json['type']),
      configs: Configs.fromJson(json['configs']),
      udfChar1: json['udfChar1'],
      udfChar2: json['udfChar2'],
      udfNum1: json['udfNum1'],
      isInit: json['isInit'],
      nodes: (json['nodes'] as List).map((nodeJson) => SwitchData.fromJson(nodeJson)).toList(),
    );
  }
}
