part of app.credicorpcapital.capital_core.utilities.extension;

extension NotNullStringExtension on String? {


  bool get toBool => this == 'true';
  num? get toNumeric => num.tryParse(this!);

  double? get toDouble => num.tryParse(this!)?.toDouble();

  int? get toInt => num.tryParse(this!)?.toInt();


  DateTime? get toDateTime {
    if (this == null) {
      return null;
    }
    return DateTime.tryParse(this!);
  } 
}

 