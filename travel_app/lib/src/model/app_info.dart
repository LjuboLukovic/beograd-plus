class AppInfo {
  final String currentAppVersion;
  final num currentAppBuildNumber;
  final String minAppVersion;
  final num minAppBuildNumner;

  const AppInfo({
    required this.currentAppVersion,
    required this.currentAppBuildNumber,
    required this.minAppVersion,
    required this.minAppBuildNumner,
  });

  factory AppInfo.fromJson(Map<String, dynamic> json) {
    return AppInfo(
      currentAppVersion: json['currentAppVersion'],
      currentAppBuildNumber: json['currentAppBuildNumber'],
      minAppVersion: json['minAppVersion'],
      minAppBuildNumner: json['minAppBuildNumner'],
    );
  }
}