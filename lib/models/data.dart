// Simple representations of data with sample data

import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String locationTypeToString(LocationType locationType) {
  return switch (locationType) {
    LocationType.library => "Library",
    LocationType.cafe => "Café",
    LocationType.hall => "Hall",
  };
}

String dateTimeToString(DateTime datetime) {
  return DateFormat('MMMM d, yyyy h:mm a').format(datetime);
}

class AppColors {
  static final Color primary = Color(0xFFCC5803);
  static final Color secondary = Color(0xFFFF9505);
  static final Color tertiary = Color(0xFFFFC971);
  static final Color white = Color(0xFFDAE3E5);
  static final Color black = Color(0xFF04080F);
}

StudyPlace createRandomEntry(
  String name,
  bool isIndoors,
  LocationType locationType,
) {
  final random = Random();
  final count = random.nextInt(500);
  final rating = ((random.nextInt(count ~/ 2)) + count ~/ 2) / count;
  final date = DateTime(
    2025,
    random.nextInt(12),
    random.nextInt(28),
    random.nextInt(12) + 6,
    random.nextInt(60),
    random.nextInt(60),
    random.nextInt(1000),
  );
  return StudyPlace(name, isIndoors, locationType, date, rating, count);
}

class SampleData {
  // random values only generate on startup

  static final List<StudyPlace> sampleStudyPlaces = [
    createRandomEntry("Thode Library", true, LocationType.library),
    createRandomEntry("Thode Library - Fireball Cafe", true, LocationType.cafe),
    createRandomEntry("JHE - 1st Floor", true, LocationType.hall),
    createRandomEntry("University Hall - Cafe", true, LocationType.cafe),
    createRandomEntry("Health Sciences Library", true, LocationType.library),
  ];

  static final UserInfo userInfo = UserInfo(
    "Firstname Lastname",
    "Software Engineering",
    ["Health Sciences Library"],
    [
      "Health Sciences Library",
      "Thode Library",
      "Thode Library - Fireball Cafe",
    ],
  );
}

enum LocationType { library, cafe, hall }

class StudyPlace {
  final String name;
  final bool isIndoors;
  final LocationType locationType;
  final DateTime postedOn;
  final double rating;
  final int numReviews;

  const StudyPlace(
    this.name,
    this.isIndoors,
    this.locationType,
    this.postedOn,
    this.rating,
    this.numReviews,
  );
}

class UserInfo {
  final String name;
  final String program;
  final List<String> favoritedPlaces;
  final List<String> visitedPlaces;

  UserInfo(this.name, this.program, this.favoritedPlaces, this.visitedPlaces);
}
