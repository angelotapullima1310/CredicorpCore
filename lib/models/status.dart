part of app.credicorpcapital.capital_core.models;

class AppStatus {
  AppStatus.fromJson(Map<String, dynamic> json) {
    id = json.getString('id');
    forceUpdate = json.getBool('force_update') ?? false;
    maintenance = json.getBool('maintenance') ?? false;
    version = json.getString('version');
  }

  late bool forceUpdate;
  late bool maintenance;
  String? version;
  String? id;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'version': version,
        'force_update': forceUpdate,
        'maintenance': maintenance,
      };

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is AppStatus &&
        other.id == id &&
        forceUpdate == other.forceUpdate &&
        maintenance == other.maintenance &&
        version == other.version;
  }

  @override
  String toString() => 'AppStatus Object with id $id';
}
