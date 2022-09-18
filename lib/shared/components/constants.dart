import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



ColorScheme primarySwatch = const ColorScheme.light().copyWith(primary: const Color(0xff2fbbf0),);


void printFullText (String text)
{
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match)
  {
    if (kDebugMode) {
      print(match.group(0));
    }
  });
}

