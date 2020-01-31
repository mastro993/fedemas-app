import 'dart:math';

import 'package:fedemas_app/utils/screen_utils.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
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
      textWidth = MediaQuery.of(context).size.width * 0.70;
    } else if (screenWidth >= ScreenUtils.WIDTH_MED) {
      titleFontSize = 64.0;
      textFontSize = 24.0;
      textWidth = MediaQuery.of(context).size.width * 0.85;
    } else {
      titleFontSize = 34.0;
      textFontSize = 17.0;
      textWidth = MediaQuery.of(context).size.width;
    }

    final titleStyle = TextStyle(
      fontSize: titleFontSize,
      height: 1.2,
      fontWeight: FontWeight.w700,
    );

    final paragraphStyle = TextStyle(
      fontSize: textFontSize,
      color: Color(0xFFA8A6A1),
      height: 1.8,
    );

    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: min(textWidth, 1360),
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        //height: _mq.size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hey there 👋 nice to meet you!',
              style: titleStyle,
            ),
            SizedBox(height: 16),
            Text(
              '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis gravida elit efficitur faucibus interdum. Praesent consectetur arcu at velit varius, nec pulvinar ipsum semper. Aliquam est leo, efficitur non tempus in, maximus sit amet quam. Mauris libero nulla, mattis eu ipsum vel, porta efficitur leo. Proin accumsan tincidunt magna ac tristique. Integer hendrerit tellus sed lectus cursus pharetra. Phasellus placerat eget enim vel condimentum. Duis pretium faucibus leo non euismod. Pellentesque vitae sapien id urna venenatis fringilla vitae quis leo. Nullam eget nibh nulla. Etiam ante massa, sollicitudin in ligula congue, auctor iaculis risus. Nulla faucibus dui ac ligula suscipit tempus. Ut posuere metus ac metus tempor dictum. Morbi placerat, enim in volutpat gravida, odio dui pulvinar risus, eu feugiat leo dui non neque.

Sed at ipsum commodo ex sagittis elementum. Vestibulum nec nibh gravida, lobortis diam sit amet, malesuada nunc. In nulla diam, pharetra et luctus ut, efficitur sit amet erat. Nulla faucibus, elit a consectetur volutpat, dui ipsum vehicula urna, sit amet interdum ligula ligula et quam. Nam id porta enim. Mauris facilisis, libero eget posuere suscipit, nibh tellus eleifend ante, at pulvinar dolor est in sem. Nullam placerat sem ac ante lacinia, vitae mattis felis varius. Ut ac arcu efficitur, sagittis nibh et, aliquet justo. Donec consequat placerat venenatis. Fusce suscipit metus sit amet egestas condimentum.

Aliquam ut magna eu orci luctus elementum a quis lorem. Suspendisse et est elit. Nunc nunc dui, laoreet eget dictum nec, posuere eu arcu. Ut convallis lobortis purus, et iaculis quam semper eget. Phasellus eget dolor orci. Curabitur id mi in nulla porta pellentesque in vitae turpis. Duis blandit, enim at tincidunt vehicula, sapien sem pretium nisi, non pharetra elit enim et velit. Morbi quis arcu in nulla convallis accumsan. Nunc scelerisque eget diam ut eleifend. Curabitur enim nisl, porta ac rhoncus vel, aliquet varius magna. Proin diam eros, convallis ut turpis ac, mollis ullamcorper ex.''',
              style: paragraphStyle,
            )
          ],
        ),
      ),
    );
  }
}
