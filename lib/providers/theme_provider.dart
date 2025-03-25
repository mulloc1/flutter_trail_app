import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final textThemeProvider = Provider<TextTheme>((ref) {
  return TextTheme(
    titleSmall: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: Colors.grey),
    titleMedium: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
    titleLarge: TextStyle(fontSize: 40.sp),
    bodySmall: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
    displayLarge: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold, color: Colors.purple),
    displaySmall: TextStyle(fontSize: 18.sp),
    displayMedium: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
  );
});

final themeModeProvider = StateProvider<bool>((ref) => true);