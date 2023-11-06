part of app.credicorpcapital.capital_core.services.providers;

class AppConfigNotifier extends StateNotifier<AppConfig> {
  AppConfigNotifier(this.ref) : super(AppConfig());

  Timer? _timer;
  StateNotifierProviderRef<AppConfigNotifier, dynamic> ref;
  StreamSubscription<DocumentSnapshot<AppStatus>>? _statusSubscription;
  StreamSubscription<DocumentSnapshot<Map<String, dynamic>>>?
      _urlSetupSubscription;

  StreamSubscription<DocumentSnapshot<AppFeature>>? _featuresSubscription;

  Future<void> init() async {
    await Future.wait(
      <Future<void>>[
        readFeatures(),
      ],
    );
  }

  Future<void> _close() async {
    await _statusSubscription?.cancel();
    await _urlSetupSubscription?.cancel();
    await _featuresSubscription?.cancel();
  }

  Future<void> refresh() async {
    await _close();
    await init();
  }

  Future<DocumentSnapshot<AppFeature>> readFeatures() async {
    _featuresSubscription = DataBase.instance.featuresStream
        .listen((DocumentSnapshot<AppFeature>? result) async {
      state = state.copyWith(
        features: result?.data(),
      );
    });
    return DataBase.instance.featuresStream
        .firstWhere((DocumentSnapshot<AppFeature> item) => true);
  }

  void onDispose() {
    _timer?.cancel();
  }

  @override
  String toString() => 'state: ${state.toString()}';
}

StateNotifierProvider<AppConfigNotifier, AppConfig> appConstantsProvider =
    StateNotifierProvider<AppConfigNotifier, AppConfig>(
  (StateNotifierProviderRef<AppConfigNotifier, dynamic> ref) {
    AppConfigNotifier value = AppConfigNotifier(ref);
    ref.onDispose(value.onDispose);
    return value;
  },
  name: 'AppConfig',
);
