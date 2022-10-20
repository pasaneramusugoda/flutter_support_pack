extension DoubleExtension on double {
  String get toStringTwoFixedDecimals => toStringAsFixed(2);

  double get toTwoFixedDecimals => double.parse(toStringTwoFixedDecimals);
}
