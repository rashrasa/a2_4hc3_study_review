// Simple representations of data with sample data

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

String locationTypeToString(LocationType locationType) {
  return switch (locationType) {
    LocationType.library => "Library",
    LocationType.cafe => "Café",
    LocationType.hall => "Hall",
  };
}

String dateTimeToString(DateTime datetime) {
  final rawString = datetime.toString();
  return rawString.substring(0, rawString.length - 7);
}

class SampleData {
  static final List<StudyPlace> sampleStudyPlaces = [
    StudyPlace(
      "Thode Library",
      true,
      LocationType.library,
      DateTime(2025, 1, 21, 14, 32),
      4.1,
      305,
    ),
    StudyPlace(
      "Thode Library - Fireball Cafe",
      true,
      LocationType.cafe,
      DateTime(2025, 1, 17, 19, 23),
      4.2,
      306,
    ),
    StudyPlace(
      "John Hodgins Engineering Building - 1st Floor",
      true,
      LocationType.hall,
      DateTime(2025, 1, 13, 12, 19),
      3.9,
      102,
    ),
  ];
}
