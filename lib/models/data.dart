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

double randomRating() {
  return Random().nextDouble() * 3 + 2;
}

int randomUserCount() {
  return Random().nextInt(500);
}

class SampleData {
  // random values only generate on startup
  static final List<StudyPlace> sampleStudyPlaces = [
    StudyPlace(
      "Thode Library",
      true,
      LocationType.library,
      DateTime(2025, 1, 21, 14, 32),
      randomRating(),
      randomUserCount(),
    ),
    StudyPlace(
      "Thode Library - Fireball Cafe",
      true,
      LocationType.cafe,
      DateTime(2025, 1, 17, 19, 23),
      randomRating(),
      randomUserCount(),
    ),
    StudyPlace(
      "JHE - 1st Floor",
      true,
      LocationType.hall,
      DateTime(2025, 1, 13, 12, 19),
      randomRating(),
      randomUserCount(),
    ),
    StudyPlace(
      "University Hall - Cafe",
      true,
      LocationType.cafe,
      DateTime(2025, 1, 12, 11, 14),
      randomRating(),
      randomUserCount(),
    ),
    StudyPlace(
      "Health Sciences Library",
      true,
      LocationType.library,
      DateTime(2025, 9, 13, 7, 50),
      randomRating(),
      randomUserCount(),
    ),
  ];

  static final UserInfo userInfo = UserInfo(
    "Bugs Bunny",
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
