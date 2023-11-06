part of app.credicorpcapital.capital_core.services;

class DataBase {
  DataBase._();
  static final DataBase instance = DataBase._();

  static const String _collectionKey = 'app';
  static const String _featuresKey = 'features';
  static const String _statusKey = 'status'; 
 

  Stream<DocumentSnapshot<AppStatus>> get statusStream => database!
      .collection(_collectionKey)
      .doc(_statusKey)
      .withConverter<AppStatus>(
        fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshots, _) =>
            AppStatus.fromJson(<String, dynamic>{
          ...snapshots.data()!,
          'id': snapshots.id,
        }),
        toFirestore: (AppStatus data, _) => data.toJson(),
      )
      .snapshots();

  Stream<DocumentSnapshot<AppFeature>> get featuresStream => database!
      .collection(_collectionKey)
      .doc(_featuresKey)
      .withConverter<AppFeature>(
        fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshots, _) =>
            AppFeature.fromJson(<String, dynamic>{
          ...snapshots.data()!,
          'id': snapshots.id,
        }),
        toFirestore: (AppFeature data, _) => data.toJson(),
      )
      .snapshots();

  Future<AppFeature> featuresCollection() async {
    DocumentSnapshot<Map<String, dynamic>> document =
        await database!.collection(_collectionKey).doc(_featuresKey).get();
    Map<String, dynamic>? dataSnapshot = document.data();
    return AppFeature.fromJson(<String, dynamic>{
      ...dataSnapshot!,
      'id': document.id,
    });
  }
}
