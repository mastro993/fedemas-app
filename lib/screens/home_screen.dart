import 'package:flutter/material.dart';
import 'dart:js' as js;

class HomeScreen extends StatelessWidget {
  void openUrl(String url) {
    js.context.callMethod("open", [url]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(24),
                  child: Image.asset('images/codercat.gif')),
              Text(
                'Hey.',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'If you can\'t see anything it\'s because I\'m still building this site and I don\'t have anough time to do it.',
                style: Theme.of(context).textTheme.body1,
                textAlign: TextAlign.center,
              ),
              Text(
                'jk I\'m a f#cking lazy ass.',
                style: Theme.of(context).textTheme.caption,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'In the meantime you can poke around into my stuff below.',
                style: Theme.of(context).textTheme.body1,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Image.asset('images/stackoverflow.png'),
                    tooltip: 'Stackoverflow',
                    onPressed: () => openUrl(
                        'https://stackoverflow.com/story/fedemas'),
                  ),
                  IconButton(
                    icon: Image.asset('images/hackerrank.png'),
                    tooltip: 'HackerRank',
                    onPressed: () =>
                        openUrl('https://www.hackerrank.com/fedemas'),
                  ),
                  IconButton(
                    icon: Image.asset('images/linkedin.png'),
                    tooltip: 'Linkedin',
                    onPressed: () =>
                        openUrl('https://www.linkedin.com/in/fedemas/'),
                  ),
                  IconButton(
                    icon: Image.asset('images/github.png'),
                    tooltip: 'GitHub',
                    onPressed: () => openUrl('https://github.com/mastro993'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
