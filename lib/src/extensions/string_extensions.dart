import 'package:flutter/material.dart';

extension StringExtension on String {
  Color get color => Color(int.parse(replaceAll('#', '0xff')));
}