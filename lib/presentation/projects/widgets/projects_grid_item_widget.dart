import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProjectGridItem extends StatelessWidget {
  final String name;
  final String description;
  final String cover;
  final Function() onTap;

  final _borderRadius = BorderRadius.circular(8.0);

  ProjectGridItem({
    @required this.name,
    this.description,
    this.cover,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            image: DecorationImage(
              image: NetworkImage(cover),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // child: Container(
        //   decoration: new BoxDecoration(
        //     image: new DecorationImage(
        //       image: new NetworkImage(_project.coverImage),
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        //   child: _project.released
        //       ? Container()
        //       : ClipRect(
        //           child: new BackdropFilter(
        //             filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        //             child: new Container(
        //               decoration: new BoxDecoration(
        //                   color: Colors.white.withOpacity(0.0)),
        //               child: Center(
        //                 child: Text(
        //                   'Coming Soon',
        //                   style: TextStyleUtils.of(context).title,
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        // ),
      ),
    );

    // return Container(
    //   decoration: BoxDecoration(
    //       border: Border.all(
    //         width: 2,
    //         color: const Color(0x10A8A6A1),
    //       ),
    //       borderRadius: _borderRadius),
    //   child: Center(
    //     child: Text(
    //       'Coming Soon',
    //       style: TextStyleUtils.of(context)
    //           .subTitle
    //           .copyWith(color: const Color(0x40A8A6A1)),
    //     ),
    //   ),
    // );
  }
}
