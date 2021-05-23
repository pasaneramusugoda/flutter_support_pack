import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String format(String pattern, [String? locale]) =>
      DateFormat(pattern, locale).format(this);

  //region date
  //region date month year
  String toDMY([String? separator1, String? separator2]) =>
      DateFormat('d${separator1}M${separator1}y').format(this);

  String toDdMmYy([String? separator1, String? separator2]) =>
      DateFormat('dd${separator1}MM${separator2}yy').format(this);

  String toDdMmYyyy([String? separator1, String? separator2]) =>
      DateFormat('dd${separator1}MM${separator2}yyyy').format(this);

  String toDdMmmYy([String? separator1, String? separator2]) =>
      DateFormat('dd${separator1}MMM${separator2}yy').format(this);

  String toDdMmmYyyy([String? separator1, String? separator2]) =>
      DateFormat('dd${separator1}MMM${separator2}yyyy').format(this);

  //endregion

  //region month date year
  String toMDY([String? separator1, String? separator2]) =>
      DateFormat('M${separator1}d${separator2}y').format(this);

  String toMmDdYy([String? separator1, String? separator2]) =>
      DateFormat('MM${separator1}dd${separator2}yy').format(this);

  String toMmDdYyyy([String? separator1, String? separator2]) =>
      DateFormat('MM${separator1}dd${separator2}yyyy').format(this);

  String toMmmDdYy([String? separator1, String? separator2]) =>
      DateFormat('MMM${separator1}dd${separator2}yy').format(this);

  String toMmmDdYyyy([String? separator1, String? separator2]) =>
      DateFormat('MMM${separator1}dd${separator2}yyyy').format(this);

  //endregion

  //region year month date
  String toYMD([String? separator1, String? separator2]) =>
      DateFormat('y${separator1}M${separator2}d').format(this);

  String toYyMmDd([String? separator1, String? separator2]) =>
      DateFormat('yy${separator1}MM${separator2}dd').format(this);

  String toYyyyMmDd([String? separator1, String? separator2]) =>
      DateFormat('yyyy${separator1}MM${separator2}dd').format(this);

  String toYyMmmDd([String? separator1, String? separator2]) =>
      DateFormat('yy${separator1}MMM${separator2}dd').format(this);

  String toYyyyMmmDd([String? separator1, String? separator2]) =>
      DateFormat('yyyy${separator1}MMM${separator2}dd').format(this);
//endregion
//endregion

}
