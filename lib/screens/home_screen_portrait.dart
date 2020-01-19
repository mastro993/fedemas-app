import 'dart:math';

import 'package:fedemas_app/widgets/education_container.dart';
import 'package:fedemas_app/widgets/profile_container.dart';
import 'package:fedemas_app/widgets/projects_container.dart';
import 'package:fedemas_app/widgets/summary_container.dart';
import 'package:fedemas_app/widgets/work_container.dart';
import 'package:flutter/material.dart';

class HomeScreenPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mq = MediaQuery.of(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(24),
            width: double.infinity,
            child: Column(
              children: <Widget>[
                ProfileContainer(),
                SummaryContainer(),
                WorkContainer(),
                EducationContainer(),
                ProjectsContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
