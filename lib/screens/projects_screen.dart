import 'package:fedemas_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _ProjectsSummary(),
        _ProjectsGrid(),
      ],
    );
  }
}

class _ProjectsSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;
    double textWidth = 0;
    double titleFontSize = 0;
    double textFontSize = 0;
    if (screenWidth >= ScreenUtils.WIDTH_LARGE) {
      titleFontSize = 64.0;
      textFontSize = 24.0;
      textWidth = MediaQuery.of(context).size.width * 0.60;
    } else if (screenWidth >= ScreenUtils.WIDTH_MED) {
      titleFontSize = 64.0;
      textFontSize = 24.0;
      textWidth = MediaQuery.of(context).size.width * 0.75;
    } else {
      titleFontSize = 40.0;
      textFontSize = 19.0;
      textWidth = MediaQuery.of(context).size.width;
    }
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.70,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Container(
        width: textWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Hey there 👋',
              style: TextStyle(
                fontSize: titleFontSize,
                height: 1.2,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis gravida elit efficitur faucibus interdum. Praesent consectetur arcu at velit varius, nec pulvinar ipsum semper. Aliquam est leo, efficitur non tempus in, maximus sit amet quam. Mauris libero nulla, mattis eu ipsum vel, porta efficitur leo. Proin accumsan tincidunt magna ac tristique. Integer hendrerit tellus sed lectus cursus pharetra. Phasellus placerat eget enim vel condimentum. Duis pretium faucibus leo non euismod. Pellentesque vitae sapien id urna venenatis fringilla vitae quis leo. Nullam eget nibh nulla. Etiam ante massa, sollicitudin in ligula congue, auctor iaculis risus. Nulla faucibus dui ac ligula suscipit tempus. Ut posuere metus ac metus tempor dictum. Morbi placerat, enim in volutpat gravida, odio dui pulvinar risus, eu feugiat leo dui non neque.',
              style: TextStyle(
                fontSize: textFontSize,
                color: Colors.white.withOpacity(0.5),
                height: 1.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ProjectsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: Container(
        width: 1600,
        padding: EdgeInsets.all(24.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 560.0,
              crossAxisSpacing: 48.0,
              mainAxisSpacing: 48.0),
          itemBuilder: (context, index) => _ProjectGridItem(),
        ),
      ),
    );
  }
}

class _ProjectGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Image.network(
            'https://www.adalu.it/wp-content/uploads/2015/06/default-placeholder-1240x698.png',
            color: Colors.red,
            fit: BoxFit.cover,
          )),
          SizedBox(height: 8),
          Text(
            'Title',
            style: TextStyle(
              fontSize: 19,
              height: 1.5,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Subtitle',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.5),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
