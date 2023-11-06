part of app.credicorpcapital.capital_core.models;

class AppConfig {
  AppConfig({
    this.features,
    this.status,
  });

  AppFeature? features;
  AppStatus? status;

  @override
  int get hashCode => Object.hash(
        features,
        status,
      );

  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      other is AppConfig &&
          other.runtimeType == runtimeType &&
          other.hashCode == hashCode;

  AppConfig copyWith({
    AppFeature? features,
    AppStatus? status,
  }) =>
      AppConfig(
        features: features ?? this.features,
        status: status ?? this.status,
      );

  @override
  String toString() => 'AppConfig $toJson';

  Map<String, dynamic> get toJson => <String, dynamic>{
        'features': features,
        'status': status,
      };
}
