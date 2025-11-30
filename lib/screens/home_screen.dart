import 'package:a2_4hc3_study_review/models/data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            _buildUserInfoWidget(context, SampleData.userInfo),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Column(
                  children: [
                    Text(
                      "Study Places",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildFilterBar(context),

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
                          separatorBuilder: (context, index) =>
                              Divider(height: 8),
                          itemCount: SampleData.sampleStudyPlaces.length,
                          physics: AlwaysScrollableScrollPhysics(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
                    "${(place.rating * 100).toStringAsPrecision(2)}%",
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.thumb_up),
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

  Widget _buildUserInfoWidget(BuildContext context, UserInfo userInfo) {
    return Container(
      decoration: BoxDecoration(color: AppColors.tertiary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome back, ', style: TextStyle(fontSize: 18)),
              Text(
                userInfo.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text('!', style: TextStyle(fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterBar(BuildContext context) {
    return Column(
      children: [
        Row(children: [SearchBar()]),
      ],
    );
  }
}
