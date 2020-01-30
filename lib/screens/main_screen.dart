import 'dart:math';

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

  ScrollController _controller;
  double _navbarHeight = 0.0;
  bool _scrolledToTop = true;

  _scrollListener() {
    bool scrolledToTop = _controller.offset <= (_navbarHeight / 2);
    if (scrolledToTop != _scrolledToTop) {
      setState(() {
        _scrolledToTop = scrolledToTop;
      });
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;

    if (screenWidth >= ScreenUtils.WIDTH_LARGE) {
      _navbarHeight = 104.0;
    } else if (screenWidth >= ScreenUtils.WIDTH_MED) {
      _navbarHeight = 96.0;
    } else {
      _navbarHeight = 72.0;
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('images/bg.png', fit: BoxFit.cover),
          CustomScrollView(
            controller: _controller,
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverAppBar(
                // Empty leading removes the "back arrow" button when endDrawer is opened
                leading: Container(),
                // Empty actions list removes the default "burger button" to open the endDrawer
                actions: <Widget>[Container()],
                backgroundColor: Colors.transparent,
                floating: true,
                pinned: false,
                snap: true,
                expandedHeight: _navbarHeight,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: <Widget>[
                      AnimatedOpacity(
                          opacity: _scrolledToTop ? 0.0 : 1.0,
                          duration: Duration(milliseconds: 250),
                          child: Container(
                            color: Colors.black,
                          )),
                      NavigationBar(
                        onPageSelect: _onPageSelect,
                        selectedPage: _pageIndex,
                        preferredSize: Size.fromHeight(_navbarHeight),
                      )
                    ],
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
                              mq.size.height - _navbarHeight - MainFooter.SIZE,
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
      ),
      endDrawer: MainDrawer(
        selectedPage: _pageIndex,
        onPageSelect: _onPageSelect,
      ),
    );
  }
}
