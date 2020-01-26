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

  @override
  Widget build(BuildContext context) {
    final _mq = MediaQuery.of(context);
    final _isWide = _mq.size.width >= ScreenUtils.landscapeMinWidth;
    return Scaffold(
      appBar: NavigationBar(
        onPageSelect: _onPageSelect,
        selectedPage: _pageIndex,
        preferredSize: Size.fromHeight(_isWide ? 128.0 : 96.0),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: new BoxConstraints(
                minHeight: _mq.size.height - 96.0 - MainFooter.SIZE,
              ),
              child: _getCurrentPage(),
            ),
            MainFooter(),
          ],
        ),
      ),
      endDrawer: MainDrawer(
        selectedPage: _pageIndex,
        onPageSelect: _onPageSelect,
      ),
    );
  }
}
