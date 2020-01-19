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
      body: _New(),
    );
  }
}

class _New extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    return Container(
      height: _mediaQuery.size.height,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          color: const Color(0xFF1a1a1a), //Colors.white,
          width: 1280,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ProfileContainer(),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: <Widget>[
                        SummaryContainer(),
                        WorkContainer(),
                        EducationContainer(),
                        ProjectsContainer()
                      ],
                    ),
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
