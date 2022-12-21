import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';

extension StringExtension on String {
  Color get color => Color(int.parse(replaceAll('#', '0xff')));

  num get currency => Currency.parse(this);

  num get currencyCompact => Currency.parseCompact(this);

  num get currencySimple => Currency.parseSimple(this);

  num get currencyCompactSimple => Currency.parseCompactSimple(this);

  num get numberFormatterParse => NumberFormatter.parse(this);

  DateTime? get dateTime => DateTime.tryParse(this);
}

extension NullStringExtension on String? {
  Color? get color =>
      isNotNullOrEmpty ? Color(int.parse(this!.replaceAll('#', '0xff'))) : null;

  num? get currency => isNotNullOrEmpty ? Currency.parse(this!) : null;

  num? get currencyCompact =>
      isNotNullOrEmpty ? Currency.parseCompact(this!) : null;

  num? get currencySimple =>
      isNotNullOrEmpty ? Currency.parseSimple(this!) : null;

  num? get currencyCompactSimple =>
      isNotNullOrEmpty ? Currency.parseCompactSimple(this!) : null;

  DateTime? get dateTime => isNotNullOrEmpty ? DateTime.tryParse(this!) : null;

  bool get isNotNullOrEmpty => this != null && (this?.isNotEmpty ?? false);
}
