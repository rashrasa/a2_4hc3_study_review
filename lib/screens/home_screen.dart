import 'package:a2_4hc3_study_review/models/data.dart';
import 'package:a2_4hc3_study_review/screens/study_listing.dart';
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
      drawer: AppDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _buildUserInfoWidget(SampleData.userInfo),
            Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16, left: 8, right: 8),
              child: _buildNavigationWidget(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoWidget(UserInfo userInfo) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(color: AppColors.tertiary),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome back, ', style: TextStyle(fontSize: 24)),
              Text(
                userInfo.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text('!', style: TextStyle(fontSize: 24)),
            ],
          ),
          Text(userInfo.program),
        ],
      ),
    );
  }

  Widget _buildNavigationWidget(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        _buildNavigationWidgetItem(
          "Study Places",
          Icons.place,
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StudyListing()),
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationWidgetItem(
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
