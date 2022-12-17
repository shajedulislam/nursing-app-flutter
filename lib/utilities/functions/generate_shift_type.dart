import 'package:flutter/material.dart';

Future<String?> generateShiftType() async {
  TimeOfDay now = TimeOfDay.now();
  if (now.hour >= 21 && now.hour < 24) {
    if (now.hour == 21 && now.minute < 30) {
      return "evening";
    }
    return "night";
  }
  if (now.hour >= 0 && now.hour <= 6) {
    if (now.hour == 6 && now.minute >= 30) {
      return "morning";
    }
    return "night";
  }
  if (now.hour >= 6 && now.hour < 14) {
    if (now.hour == 6 && now.minute < 30) {
      return "night";
    }
    return "morning";
  }
  if (now.hour >= 14 && now.hour <= 21) {
    if (now.hour == 21 && now.minute >= 30) {
      return "night";
    }
    return "evening";
  }
  return null;
}
