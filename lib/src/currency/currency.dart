import 'package:intl/intl.dart';

class Currency {
  static Currency? _instance;
  final NumberFormat _currency;
  final NumberFormat _currencyCompact;
  final NumberFormat _currencySimple;
  final NumberFormat _currencyCompactSimple;

  Currency._internal(this._currency, this._currencyCompact,
      this._currencySimple, this._currencyCompactSimple) {
    _instance = this;
  }

  /// Initialize [Currency] instance
  ///
  /// * [locale] : If not specified, it will use the current default locale.
  /// * [name] : If specified, the currency with that ISO 4217 name will be used
  /// * [symbol] : If [symbol] provided, then [name] will be ignored.
  /// * [decimalDigits] : Sets number of decimal places. Default value is 2.
  static void init({
    String? locale,
    String? name,
    String? symbol,
    int decimalDigits = 2,
  }) {
    locale ??= Intl.defaultLocale;

    final currency = NumberFormat.currency(
      locale: locale,
      name: name,
      symbol: symbol,
      decimalDigits: decimalDigits,
    );

    final currencyCompact = NumberFormat.compactCurrency(
      locale: locale,
      name: name,
      symbol: symbol,
      decimalDigits: decimalDigits,
    );
    final currencySimple = NumberFormat.simpleCurrency(
      locale: locale,
      name: name,
      decimalDigits: decimalDigits,
    );
    final currencyCompactSimple = NumberFormat.compactSimpleCurrency(
      locale: locale,
      name: name,
      decimalDigits: decimalDigits,
    );

    _instance = _instance ??
        Currency._internal(
            currency, currencyCompact, currencySimple, currencyCompactSimple);
  }

  static void _checkInstance() {
    assert(
      _instance != null,
      '\nEnsure to initialize Currency before accessing it.'
      '\nPlease execute the init method : Currency.init()',
    );
  }

  static String format(num number) {
    _checkInstance();
    return _instance!._currency.format(number);
  }

  static String formatCompact(num number) {
    _checkInstance();
    return _instance!._currencyCompact.format(number);
  }

  static String formatSimple(num number) {
    _checkInstance();
    return _instance!._currencySimple.format(number);
  }

  static String formatCompactSimple(num number) {
    _checkInstance();
    return _instance!._currencyCompactSimple.format(number);
  }

  static num parse(String value) {
    _checkInstance();
    return _instance!._currency.parse(value);
  }

  static num parseCompact(String value) {
    _checkInstance();
    return _instance!._currencyCompact.parse(value);
  }

  static num parseSimple(String value) {
    _checkInstance();
    return _instance!._currencySimple.parse(value);
  }

  static num parseCompactSimple(String value) {
    _checkInstance();
    return _instance!._currencyCompactSimple.parse(value);
  }
}
