import 'package:intl/intl.dart';

class NumberFormatter {
  static late NumberFormatter? _instance;
  final NumberFormat _formatter;

  NumberFormatter._internal(this._formatter) {
    _instance = this;
  }

  /// Initialize [NumberFormatter] instance
  static void init({NumberFormat? formatter}) {
    _instance = NumberFormatter._internal(formatter ?? NumberFormat());
  }

  static NumberFormatter _getInstance() {
    assert(
      _instance != null,
      '\nEnsure to initialize DecimalFormatter before accessing it.'
      '\nPlease execute the init method : DecimalFormatter.init()',
    );

    return _instance!;
  }

  static String format(num value) => _getInstance()._formatter.format(value);

  static num parse(String value) => _getInstance()._formatter.parse(value);
}
