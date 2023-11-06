 

part of app.credicorpcapital.capital_core.models;

class AppStatus {
  AppStatus.fromJson(Map<String, dynamic> json) {
    id = json.getString('id');
    forceUpdate = json.getBool('force_update') ?? false;
    maintenance = json.getBool('maintenance') ?? false;
    maintenanceTybaTech = json.getBool('maintenance_tyba_tech') ?? false;
    verifyInAppUpdate = json.getBool('verify_inapp_update') ?? false;
    version = json.getString('version');
    if (json['maintenance_date'] != null) {
      maintenanceDate = json['maintenance_date'].toDate().toString().toDateTime;
    }
    maintenanceTime = json.getString('maintenance_time');
  }

  late bool forceUpdate;
  late bool maintenance;
  late bool maintenanceTybaTech;
  late bool verifyInAppUpdate;
  String? version;
  DateTime? maintenanceDate;
  String? maintenanceTime;
  String? id;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'verify_inapp_update': verifyInAppUpdate,
        'version': version,
        'force_update': forceUpdate,
        'maintenance_tyba_tech': maintenanceTybaTech,
        'maintenance': maintenance,
        'maintenance_date': maintenanceDate,
        'maintenance_time': maintenanceTime,
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
        maintenanceTybaTech == other.maintenanceTybaTech &&
        maintenance == other.maintenance &&
        version == other.version &&
        maintenanceDate == other.maintenanceDate &&
        maintenanceTime == other.maintenanceTime;
  }

  @override
  String toString() => 'AppStatus Object with id $id';
}
