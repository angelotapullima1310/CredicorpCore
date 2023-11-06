part of app.credicorpcapital.capital_core.services.providers;

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<dynamic> provider,
    Object? value,
    ProviderContainer container,
  ) {
    stateMapper(provider, value);
  }

  @override
  void didDisposeProvider(
    ProviderBase<dynamic> provider,
    ProviderContainer container,
  ) {
    debugPrint('⚠️ provider `${provider.name}` was disposed');
  }

  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    stateMapper(provider, newValue, isChanged: true);
  }

  String getProviderValue(Object? value) {
    if (value != null) {
      if (value is List<Page<dynamic>>) {
        return 'with value pages: ${value.map((Page<dynamic> e) => e.name)}';
      }
      return 'with value $value';
    } else {
      return 'without value';
    }
  }

  void stateMapper(
    ProviderBase<dynamic> provider,
    Object? newValue, {
    bool isChanged = false,
  }) {
    String subText = isChanged ? 'will be update' : 'was initialized';
    debugPrint(
      '''💡 provider `${provider.name}` $subText ${getProviderValue(newValue)}''',
    );
  }
}
