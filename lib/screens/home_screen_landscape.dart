import 'package:fedemas_app/widgets/education_container.dart';
import 'package:fedemas_app/widgets/profile_container.dart';
import 'package:fedemas_app/widgets/projects_container.dart';
import 'package:fedemas_app/widgets/summary_container.dart';
import 'package:fedemas_app/widgets/work_container.dart';
import 'package:flutter/material.dart';

class HomeScreenLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          color: Colors.white,
          width: 1280,
          height: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ProfileContainer(),
              SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(24),
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SummaryContainer(),
                      WorkContainer(),
                      EducationContainer(),
                      ProjectsContainer()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
