import 'package:a2_4hc3_study_review/models/data.dart';
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
      child: Column(
        children: [
          Align(
            alignment: AlignmentGeometry.topCenter,
            child: Padding(
              padding: EdgeInsetsGeometry.only(top: 16),
              child: Column(
                spacing: 8,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(),
                    child: Text(
                      'Title',
                      style: TextStyle(fontSize: 48, color: AppColors.primary),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.only(),
                    child: Text(
                      'Subtitle',
                      style: TextStyle(
                        fontSize: 36,
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                  Divider(indent: 16, endIndent: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
