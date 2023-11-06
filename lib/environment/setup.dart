part of app.credicorpcapital.capital_core.environment;

Future<void> appConfig({FirebaseOptions? options}) async {
  await Firebase.initializeApp(
    options: options,
  );
  database = FirebaseFirestore.instance;
}
