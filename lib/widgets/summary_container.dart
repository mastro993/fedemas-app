import 'package:flutter/material.dart';

class SummaryContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Summary',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras faucibus, nunc blandit pellentesque eleifend, neque velit vehicula nulla, sed accumsan eros nunc a felis. Donec magna justo, mattis vel porttitor id, mattis et dui. In vestibulum, tellus nec fermentum euismod, massa risus fringilla lectus, et porttitor mi enim at mi. Pellentesque at nulla diam. Nullam turpis quam, porta ac molestie non, bibendum a lorem. Fusce sit amet varius turpis, at dictum arcu. Morbi vitae erat sed felis faucibus vestibulum. Cras posuere neque neque, dapibus tempor nulla blandit eu. Suspendisse at est in metus varius blandit. Vivamus ut egestas enim. Praesent lacinia nec elit non malesuada. Duis auctor, massa et ornare finibus, ligula nisi varius dolor, vel luctus quam ligula non ipsum. Etiam maximus purus orci, sit amet venenatis turpis suscipit id. Sed at elit at libero vehicula fringilla vitae ut lorem. Maecenas ultrices velit sed nisi mattis, hendrerit volutpat ex sollicitudin.',
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
