import 'package:flutter/material.dart';
import 'package:flutter_support_pack/flutter_support_pack.dart';

extension StringExtension on String {
  Color get color => Color(int.parse(replaceAll('#', '0xff')));

  num get currency => Currency.parse(this);

  num get currencyCompact => Currency.parseCompact(this);

  num get currencySimple => Currency.parseSimple(this);

  num get currencyCompactSimple => Currency.parseCompactSimple(this);
}
