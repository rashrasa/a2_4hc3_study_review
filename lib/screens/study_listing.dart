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
                itemBuilder: (context, index) => _buildStudyPlaceItem(
                  context,
                  SampleData.sampleStudyPlaces[index],
                ),
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

  Widget _buildStudyPlaceItem(BuildContext context, StudyPlace place) {
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

  Widget _buildNavigationWidget(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 12,
      runSpacing: 12,
      children: [
        _buildNavigationWidgetItem(
          context,
          "Study Places",
          Icons.place,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StudyListing()),
          ),
        ),
        _buildNavigationWidgetItem(
          context,
          "Favorite Places",
          Icons.star,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StudyListing()),
          ),
        ),
        _buildNavigationWidgetItem(
          context,
          "Visited Places",
          Icons.history,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StudyListing()),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationWidgetItem(
    BuildContext context,
    String name,
    IconData icon,
    void Function() onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        constraints: BoxConstraints.tight(Size(175, 175)),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          border: BoxBorder.all(color: AppColors.primary, width: 4),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 40),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w900,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
