import 'package:fedemas_app/model/user.dart';
import 'package:flutter/material.dart';
import 'dart:js' as js;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileContainer extends StatelessWidget {
  // ! To be provided externally
  final _user = const User(
    name: 'Federico Mastrini',
    email: 'federicomastrini93@gmail.com',
    location: 'Monzone (MS), Italy',
    education: 'Software Engineering',
    occupation: 'Software Developer',
    githubUrl: 'https://github.com/mastro993',
    hackerrankUrl: 'https://www.hackerrank.com/fedemas',
    linkedinUrl: 'https://www.linkedin.com/in/fedemas/',
    stackoverflowUrl: 'https://stackoverflow.com/users/story/5372892',
  );

  final _separatorColor = const Color(0xFF2a2a2a);

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
            backgroundImage: AssetImage('images/propic.png'),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(height: 40),
          Text(
            _user.name,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 8),
          Text(
            _user.occupation,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 48),
          _ProfileInfoItem(_user.email, FontAwesomeIcons.paperPlane),
          Divider(color: _separatorColor),
          _ProfileInfoItem(_user.location, FontAwesomeIcons.mapMarkerAlt),
          Divider(color: _separatorColor),
          _ProfileInfoItem(_user.education, FontAwesomeIcons.graduationCap),
          SizedBox(height: 48),
          _DownloadResumeButton(),
          SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _SocialProfileItem(
                'GitHub',
                FontAwesomeIcons.github,
                _user.githubUrl,
              ),
              _SocialProfileItem(
                'HackerRank',
                FontAwesomeIcons.hackerrank,
                _user.hackerrankUrl,
              ),
              _SocialProfileItem(
                'LinkedIn',
                FontAwesomeIcons.linkedinIn,
                _user.linkedinUrl,
              ),
              _SocialProfileItem(
                'StackOverflow',
                FontAwesomeIcons.stackOverflow,
                _user.stackoverflowUrl,
              ),
            ],
          )
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
            Icon(
              FontAwesomeIcons.fileDownload,
              size: 21,
            ),
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
            size: 16,
          ),
        ),
        Text(_title),
      ],
    );
  }
}

class _SocialProfileItem extends StatelessWidget {
  final IconData _iconData;
  final String _url;
  final String _description;

  _SocialProfileItem(this._description, this._iconData, this._url);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          _iconData,
          color: const Color(0xFFE4E7EB),
        ),
        tooltip: _description,
        onPressed: () => js.context.callMethod("open", [_url]));
  }
}
