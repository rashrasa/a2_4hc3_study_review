import 'package:a2_4hc3_study_review/models/data.dart';
import 'package:a2_4hc3_study_review/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Text("Study Places"),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => _buildStudyPlaceItem(
                SampleData.sampleStudyPlaces.elementAt(index),
              ),
              separatorBuilder: (context, index) => Divider(height: 24),
              itemCount: SampleData.sampleStudyPlaces.length,
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 24,
                bottom: 24,
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
        border: Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(place.name),
              Text(locationTypeToString(place.locationType)),
              Text(dateTimeToString(place.postedOn.toLocal())),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [place.isIndoors ? Icon(Icons.house) : Icon(Icons.grass)],
          ),
        ],
      ),
    );
  }
}
