part of app.credicorpcapital.capital_core.models;



class AppFeature {
  AppFeature.fromJson(Map<String, dynamic> json) {
    id = json.getString('id');
    externaUrl = json
            .getList('external_url')
            ?.map((dynamic item) => item as String)
            .toList() ??
        <String>[];
  }
  String? id;
  late List<String> externaUrl;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'externaUrl': externaUrl,
      };

  @override
  int get hashCode => id.hashCode ^ externaUrl.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other.runtimeType == runtimeType &&
          other is AppFeature &&
          hashCode == other.hashCode;

  @override
  String toString() => 'AppFeature Object with id ${toJson()}';
}
