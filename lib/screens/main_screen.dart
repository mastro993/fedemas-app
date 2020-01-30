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

  ScrollController _controller;
  double _navbarHeight = 0.0;
  double _navbarOpacity = 0.0;

  _scrollListener() {
    setState(() {
      if (_controller.offset >= _navbarHeight) {
        _navbarOpacity = 1.0;
      } else {
        _navbarOpacity = max(_controller.offset / _navbarHeight, 0);
      }
    });
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
      _navbarHeight = 80.0;
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
                actions: <Widget>[Container()],
                backgroundColor: Colors.black.withOpacity(_navbarOpacity),
                floating: true,
                pinned: false,
                snap: true,
                expandedHeight: _navbarHeight,
                flexibleSpace: FlexibleSpaceBar(
                  background: NavigationBar(
                    onPageSelect: _onPageSelect,
                    selectedPage: _pageIndex,
                    preferredSize: Size.fromHeight(_navbarHeight),
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
