import 'package:fedemas_app/screens/about_screen.dart';
import 'package:fedemas_app/screens/projects_screen.dart';
import 'package:fedemas_app/utils/screen_utils.dart';
import 'package:fedemas_app/widgets/main_drawer.dart';
import 'package:fedemas_app/widgets/main_footer.dart';
import 'package:fedemas_app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;

  void _onPageSelect(int newIndex) {
    setState(() {
      _pageIndex = newIndex;
    });
  }

  Widget _getCurrentPage() {
    switch (_pageIndex) {
      case 0:
        return ProjectsScreen();
      case 1:
        return AboutScreen();
      default:
        return ProjectsScreen();
    }
  }

  Widget listItem(Color color, String title) => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
        ),
        child: Center(
          child: Text(
            "$title",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;
    // print(screenWidth);
    double navbarHeight;
    if (screenWidth >= ScreenUtils.WIDTH_LARGE) {
      navbarHeight = 104.0;
    } else if (screenWidth >= ScreenUtils.WIDTH_MED) {
      navbarHeight = 96.0;
    } else {
      navbarHeight = 80.0;
    }
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset('images/bg.png', fit: BoxFit.cover),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              ///Properties of app bar
              ///
              /// Color of app bar when it is collapsed
              backgroundColor: Colors.black,

              /// Set to false so that appbar is always invisible after
              /// collapsing
              /// If set to true here, the app bar will expand as soon as you
              /// start scrolling up even if you haven't reached the top
              floating: true,

              /// To make the app bar visible at all times after collapsing
              /// we set pinned to true
              pinned: false,
              snap: true,
              expandedHeight: 96.0,

              ///Properties of the App Bar when it is expanded
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "SliverAppBar Widget",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                background: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: new BoxConstraints(
                        minHeight:
                            mq.size.height - navbarHeight - MainFooter.SIZE,
                      ),
                      child: _getCurrentPage(),
                    ),
                    MainFooter(),
                  ],
                ),
              ]),
            )
          ],
        ),
      ],
    ));
    // return Scaffold(
    //   appBar: NavigationBar(
    //     onPageSelect: _onPageSelect,
    //     selectedPage: _pageIndex,
    //     preferredSize: Size.fromHeight(navbarHeight),
    //   ),
    //   body: Stack(
    //     fit: StackFit.expand,
    //     children: <Widget>[
    //       Image.asset('images/bg.png', fit: BoxFit.cover,),
    //       SingleChildScrollView(
    //         physics: BouncingScrollPhysics(),
    //         child: Column(
    //           children: <Widget>[
    //             ConstrainedBox(
    //               constraints: new BoxConstraints(
    //                 minHeight: mq.size.height - navbarHeight - MainFooter.SIZE,
    //               ),
    //               child: _getCurrentPage(),
    //             ),
    //             MainFooter(),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    //   endDrawer: MainDrawer(
    //     selectedPage: _pageIndex,
    //     onPageSelect: _onPageSelect,
    //   ),
    // );
  }
}
