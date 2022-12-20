import 'package:flutter_support_pack/flutter_support_pack.dart';
import 'package:flutter_support_pack/src/number_formatter/number_formatter.dart';

extension NumberExtension on num {
  String get format => NumberFormatter.format(this);

  String get currency => Currency.format(this);

  String get currencyCompact => Currency.formatCompact(this);

  String get currencySimple => Currency.formatSimple(this);

  String get currencyCompactSimple => Currency.formatCompactSimple(this);
}
