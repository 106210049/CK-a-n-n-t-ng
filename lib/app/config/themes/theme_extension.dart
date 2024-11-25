import 'package:flutter/material.dart';

extension ThemeDataFix on ThemeData {
  Color get backgroundColor {
    return this.colorScheme.background;
  }
}
