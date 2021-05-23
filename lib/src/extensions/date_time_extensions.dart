import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format(String pattern, [String? locale]) =>
      DateFormat(pattern, locale).format(this);

  //region date
  //region date month year
  String toDMY([String? separator]) =>
      DateFormat('d${separator}M${separator}y').format(this);

  String toDdMmYy([String? separator]) =>
      DateFormat('dd${separator}MM${separator}yy').format(this);

  String toDdMmYyyy([String? separator]) =>
      DateFormat('dd${separator}MM${separator}yyyy').format(this);

  String toDdMmmYy([String? separator]) =>
      DateFormat('dd${separator}MMM${separator}yy').format(this);

  String toDdMmmYyyy([String? separator]) =>
      DateFormat('dd${separator}MMM${separator}yyyy').format(this);

  //endregion

  //region month date year
  String toMDY([String? separator]) =>
      DateFormat('M${separator}d${separator}y').format(this);

  String toMmDdYy([String? separator]) =>
      DateFormat('MM${separator}dd${separator}yy').format(this);

  String toMmDdYyyy([String? separator]) =>
      DateFormat('MM${separator}dd${separator}yyyy').format(this);

  String toMmmDdYy([String? separator]) =>
      DateFormat('MMM${separator}dd${separator}yy').format(this);

  String toMmmDdYyyy([String? separator]) =>
      DateFormat('MMM${separator}dd${separator}yyyy').format(this);

  //endregion

  //region year month date
  String toYMD([String? separator]) =>
      DateFormat('y${separator}M${separator}d').format(this);

  String toYyMmDd([String? separator]) =>
      DateFormat('yy${separator}MM${separator}dd').format(this);

  String toYyyyMmDd([String? separator]) =>
      DateFormat('yyyy${separator}MM${separator}dd').format(this);

  String toYyMmmDd([String? separator]) =>
      DateFormat('yy${separator}MMM${separator}dd').format(this);

  String toYyyyMmmDd([String? separator]) =>
      DateFormat('yyyy${separator}MMM${separator}dd').format(this);
//endregion
//endregion

}
