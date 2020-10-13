import 'package:auto_route/auto_route.dart';
import 'package:fedemas_app/core/utils/screen_utils.dart';
import 'package:fedemas_app/presentation/projects/widgets/projects_grid_coming_soon_widget.dart';
import 'package:flutter/material.dart';

import '../../../routes/router.gr.dart';
import 'projects_grid_item_widget.dart';

class ProjectsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;

    double gridWidth = 0;
    double gridMaxCrossAxisExtent = 0;

    if (screenWidth >= ScreenUtils.WIDTH_L) {
      gridWidth = screenWidth * 0.70;
      gridMaxCrossAxisExtent = gridWidth / 3;
    } else if (screenWidth >= ScreenUtils.WIDTH_S) {
      gridWidth = screenWidth * 0.90;
      gridMaxCrossAxisExtent = gridWidth / 2;
    } else {
      gridWidth = screenWidth;
      gridMaxCrossAxisExtent = gridWidth;
    }
    const edgeInsets = EdgeInsets.symmetric(vertical: 32.0);
    return Container(
      alignment: Alignment.topCenter,
      color: Colors.black,
      padding: edgeInsets,
      child: Container(
        width: gridWidth,
        padding: const EdgeInsets.all(24.0),
        child: GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 4 / 3,
            maxCrossAxisExtent: gridMaxCrossAxisExtent,
            crossAxisSpacing: 24.0,
            mainAxisSpacing: 24.0,
          ),
          children: [
            ProjectGridItem(
              name: 'Home2Work',
              description: 'Car pooling app',
              cover: 'assets/images/h2w_cover.webp',
              onTap: () => ExtendedNavigator.of(context)
                  .pushProjectDetailsHome2WorkPage(),
            ),
            ProjectGridComingSoon(),
          ],
        ),
      ),
    );
  }
}
