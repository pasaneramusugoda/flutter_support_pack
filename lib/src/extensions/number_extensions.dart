import 'package:flutter_support_pack/flutter_support_pack.dart';

extension NumberExtension on num {
  String get currency => Currency.format(this);

  String get currencyCompact => Currency.formatCompact(this);

  String get currencySimple => Currency.formatSimple(this);

  String get currencyCompactSimple => Currency.formatCompactSimple(this);
}
