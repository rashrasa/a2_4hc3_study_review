import 'package:a2_4hc3_study_review/models/data.dart';
import 'package:a2_4hc3_study_review/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.white,
          secondary: AppColors.secondary,
          onSecondary: AppColors.black,
          error: Colors.red.shade600,
          onError: Colors.white,
          surface: AppColors.tertiary,
          onSurface: AppColors.black,
        ),
        textTheme: GoogleFonts.nunitoTextTheme(),
        iconTheme: IconThemeData(color: AppColors.white),
      ),
    );
  }
}
