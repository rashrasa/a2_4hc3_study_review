import 'package:a2_4hc3_study_review/models/data.dart';
import 'package:flutter/material.dart';

class StudyListing extends StatefulWidget {
  const StudyListing({super.key});

  @override
  State<StudyListing> createState() => _StudyListingState();
}

class _StudyListingState extends State<StudyListing> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "Study Places",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 24,
                bottom: 24,
              ),

              child: ListView.separated(
                itemBuilder: (context, index) =>
                    _buildStudyPlaceItem(SampleData.sampleStudyPlaces[index]),
                separatorBuilder: (context, index) => Divider(height: 8),
                itemCount: SampleData.sampleStudyPlaces.length,
                physics: AlwaysScrollableScrollPhysics(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudyPlaceItem(StudyPlace place) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.black),
        borderRadius: BorderRadius.circular(8),
        color: AppColors.primary,
      ),
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                place.name,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                locationTypeToString(place.locationType),
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    'Posted on: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    dateTimeToString(place.postedOn.toLocal()),
                    style: TextStyle(color: AppColors.white),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              place.isIndoors ? Icon(Icons.house) : Icon(Icons.grass),
              Row(
                spacing: 4,
                children: [
                  Text(
                    place.rating.toStringAsPrecision(2),
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.star),
                ],
              ),
              Row(
                spacing: 4,
                children: [
                  Text(
                    place.numReviews.toString(),
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.people),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
