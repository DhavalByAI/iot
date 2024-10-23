class DeviceType {
  final String label;
  final String code;

  DeviceType({
    required this.label,
    required this.code,
  });

  factory DeviceType.fromJson(Map<String, dynamic> json) {
    return DeviceType(
      label: json['label'],
      code: json['code'],
    );
  }
}
