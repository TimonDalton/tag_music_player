import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

double? getRelativeRadius(
  double parentWidth,
  double parentHeight,
) {
  double smaller = parentWidth;
  if (parentHeight < smaller) {
    smaller = parentHeight;
  }
  return smaller * 0.1;
}
