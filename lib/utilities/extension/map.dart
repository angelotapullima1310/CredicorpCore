part of app.credicorpcapital.capital_core.utilities.extension;

extension MapExtension on Map<String, dynamic> {
  List<dynamic>? getList(String key) =>
      (this[key] ?? <dynamic>[]) as List<dynamic>;

  String? getString(String key) => this[key]?.toString();

  DateTime? getDateTime(String key) => getString(key)?.toDateTime;

  num? getNum(String key) => getString(key)?.toNumeric;

  double? getDouble(String key) => getString(key)?.toDouble;

  int? getInt(String key) => getString(key)?.toInt;

  bool? getBool(String key) => getString(key)?.toBool;
}
