import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/screen_utils.dart';
import '../widgets/main_drawer.dart';
import '../widgets/main_footer.dart';
import '../widgets/navigation_bar.dart';
import 'about_screen.dart';
import 'projects_screen.dart';
import 'package:flutter/animation.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _pageIndex = 0;
  ScrollController _scrollController;
  double _navbarHeight = 0.0;
  bool _scrolledToTop = true;
  Animation<double> _animation;
  AnimationController _animationController;
  StreamController<double> _streamController;

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

  void _scrollListener() {
    final bool scrolledToTop = _scrollController.offset <= (_navbarHeight / 2);
    if (scrolledToTop != _scrolledToTop) {
      setState(() {
        _scrolledToTop = scrolledToTop;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _streamController = StreamController<double>();

    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      curve: Curves.easeIn,
      parent: _animationController,
    ));

    Timer(
      const Duration(),
      () {
        _animationController.forward();
      },
    );

    throttle(_streamController.stream).listen((offset) {
      _scrollController.animateTo(
        offset,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final screenWidth = mq.size.width;
    if (screenWidth >= ScreenUtils.WIDTH_M) {
      _navbarHeight = 104.0;
    } else if (screenWidth >= ScreenUtils.WIDTH_S) {
      _navbarHeight = 96.0;
    } else {
      _navbarHeight = 72.0;
    }

    return FadeTransition(
      opacity: _animation,
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.network('/assets/images/bg.webp', fit: BoxFit.cover),
            Listener(
              onPointerSignal: _handlePointerSignal,
              child: CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: <Widget>[
                  SliverAppBar(
                    elevation: 0,
                    // Empty leading removes the "back arrow" button when endDrawer is opened
                    leading: Container(),
                    // Empty actions list removes the default "burger button" to open the endDrawer
                    actions: <Widget>[Container()],
                    backgroundColor: Colors.transparent,
                    floating: true,
                    snap: true,
                    expandedHeight: _navbarHeight,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Stack(
                        children: <Widget>[
                          AnimatedOpacity(
                            opacity: _scrolledToTop ? 0.0 : 1.0,
                            duration: const Duration(milliseconds: 250),
                            child: Container(
                              color: Colors.black,
                            ),
                          ),
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
                            constraints: BoxConstraints(
                              minHeight: mq.size.height -
                                  _navbarHeight -
                                  MainFooter.SIZE -
                                  80,
                            ),
                            child: _getCurrentPage(),
                          ),
                          const SizedBox(height: 72),
                          MainFooter(),
                        ],
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ],
        ),
        endDrawer: MainDrawer(
          selectedPage: _pageIndex,
          onPageSelect: _onPageSelect,
        ),
      ),
    );
  }

  Stream<double> throttle(Stream<double> src) async* {
    double offset = _scrollController.offset;
    DateTime dt = DateTime.now();
    await for (final delta in src) {
      if (DateTime.now().difference(dt) > const Duration(milliseconds: 200)) {
        offset = _scrollController.position.pixels;
      }
      dt = DateTime.now();
      offset += delta;
      yield offset;
    }
  }

  void _handlePointerSignal(PointerSignalEvent e) {
    if (e is PointerScrollEvent && e.scrollDelta.dy != 0) {
      _streamController.add(e.scrollDelta.dy);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}
