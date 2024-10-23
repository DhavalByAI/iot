class Configs {
  final String dataLog;
  final String isEnabled;
  final String invokeCmd;

  Configs({
    required this.dataLog,
    required this.isEnabled,
    required this.invokeCmd,
  });

  factory Configs.fromJson(Map<String, dynamic> json) {
    return Configs(
      dataLog: json['dataLog'],
      isEnabled: json['isEnabled'],
      invokeCmd: json['invokeCmd'],
    );
  }
}
