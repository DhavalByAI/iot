class SwitchData {
  final int id;
  final String label;
  final String attr;
  final String type;
  final int deviceId;
  bool isOn;

  SwitchData({
    required this.id,
    required this.label,
    required this.attr,
    required this.type,
    required this.deviceId,
    this.isOn = false,
  });

  factory SwitchData.fromJson(Map<String, dynamic> json) {
    return SwitchData(
      id: json['id'],
      label: json['label'],
      attr: json['attr'],
      type: json['type'],
      deviceId: json['deviceId'],
    );
  }
}
