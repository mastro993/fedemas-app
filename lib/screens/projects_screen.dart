import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _mq = MediaQuery.of(context);
    return Container(
      alignment: Alignment.topCenter,
      child: Container(
        width: 1000,
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 72.0),
        //height: _mq.size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Lorem ipsum dolor sit amet 👋',
              style: TextStyle(
                fontSize: 64,
                height: 1.2,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis gravida elit efficitur faucibus interdum. Praesent consectetur arcu at velit varius, nec pulvinar ipsum semper. Aliquam est leo, efficitur non tempus in, maximus sit amet quam. Mauris libero nulla, mattis eu ipsum vel, porta efficitur leo. Proin accumsan tincidunt magna ac tristique. Integer hendrerit tellus sed lectus cursus pharetra. Phasellus placerat eget enim vel condimentum. Duis pretium faucibus leo non euismod. Pellentesque vitae sapien id urna venenatis fringilla vitae quis leo. Nullam eget nibh nulla. Etiam ante massa, sollicitudin in ligula congue, auctor iaculis risus. Nulla faucibus dui ac ligula suscipit tempus. Ut posuere metus ac metus tempor dictum. Morbi placerat, enim in volutpat gravida, odio dui pulvinar risus, eu feugiat leo dui non neque.',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white.withOpacity(0.5),
                height: 1.5
              ),
            ),
          ],
        ),
      ),
    );
  }
}
