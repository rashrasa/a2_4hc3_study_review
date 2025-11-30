import 'package:a2_4hc3_study_review/models/data.dart';
import 'package:a2_4hc3_study_review/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            Align(
              alignment: AlignmentGeometry.topCenter,
              child: Padding(
                padding: EdgeInsetsGeometry.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.only(),
                      child: Text(
                        SampleData.userInfo.name,
                        style: TextStyle(
                          fontSize: 36,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.only(),
                      child: Text(
                        SampleData.userInfo.program,
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                    Divider(),
                    _buildDrawerNavigationItem(
                      context,
                      "Home",
                      Icons.home,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
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

  Widget _buildDrawerNavigationItem(
    BuildContext context,
    String name,
    IconData leadingIcon,
    Route navigateTo,
  ) {
    return GestureDetector(
      onTap: () => Navigator.push(context, navigateTo),
      child: Row(
        spacing: 8,
        children: [
          Icon(leadingIcon, size: 40, color: AppColors.primary),
          Text(
            name,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
