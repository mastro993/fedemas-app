import 'package:flutter/material.dart';
import 'dart:js' as js;

class ProfileContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 40),
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
                'http://www.learnyzen.com/wp-content/uploads/2017/08/test1-481x385.png'),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(height: 40),
          Text(
            'Federico Mastrini',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Software Engineer',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 48),
          _ProfileInfo(),
          SizedBox(height: 48),
          _DownloadResumeButton(),
          SizedBox(height: 48),
          _SocialProfiles()
        ],
      ),
    );
  }
}

class _DownloadResumeButton extends StatelessWidget {
  const _DownloadResumeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 240,
      child: FlatButton(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(24.0)),
        onPressed: () {},
        color: Theme.of(context).accentColor,
        textColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.library_books),
            SizedBox(
              width: 24.0,
            ),
            Text(
              'Download Resume',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileInfo extends StatelessWidget {
  final _separatorColor = const Color(0xFF2a2a2a);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _ProfileInfoItem('federicomastrini93@gmail.com', Icons.email),
        Divider(color: _separatorColor),
        _ProfileInfoItem('Monzone (MS), Italy', Icons.location_on),
        Divider(color: _separatorColor),
        _ProfileInfoItem('Software Development', Icons.work),
      ],
    );
  }
}

class _ProfileInfoItem extends StatelessWidget {
  final IconData _icon;
  final String _title;

  _ProfileInfoItem(this._title, this._icon);

  @override
  Widget build(BuildContext context) {
    final _iconColor = Color.fromARGB(255, 171, 179, 201);
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Icon(
            _icon,
            color: _iconColor,
          ),
        ),
        Text(_title),
      ],
    );
  }
}

class _SocialProfiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _SocialProfileItem(
            'GitHub', 'images/github.png', 'https://github.com/mastro993'),
        _SocialProfileItem('HackerRank', 'images/hackerrank.png',
            'https://www.hackerrank.com/fedemas'),
        _SocialProfileItem('LinkedIn', 'images/linkedin.png',
            'https://www.linkedin.com/in/fedemas/'),
        _SocialProfileItem('StackOverflow', 'images/stackoverflow.png',
            'https://stackoverflow.com/users/story/5372892'),
      ],
    );
  }
}

class _SocialProfileItem extends StatelessWidget {
  final String _icon;
  final String _url;
  final String _description;

  _SocialProfileItem(this._description, this._icon, this._url);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.asset(_icon,
            colorBlendMode: BlendMode.dstIn, color: Colors.red),
        tooltip: _description,
        onPressed: () => js.context.callMethod("open", [_url]));
  }
}
