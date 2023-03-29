import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class UrlLauncher extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _UrlLauncherState createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  Future<void>? _launch;

  String phoneNumber = '';

  String _launchUrl = 'https://www.google.com';

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw "couldnot launch url";
    }
  }

  Future<void> _launchInApp(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw "couldnot launch url";
    }
  }

  Future<void> _launchUniversalLinkAndroid(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceWebView: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceWebView: true);
      }
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "couldnot launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: Text('url launcher'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  child: Text("launch in Browser"),
                  onPressed: () {
                    setState(() {
                      _launch = _launchInBrowser(_launchUrl);
                    });
                  },
                ),
                ElevatedButton(
                  child: Text("launch in Browser"),
                  onPressed: () {
                    setState(() {
                      _launch = _launchInApp(_launchUrl);
                    });
                  },
                ),
                ElevatedButton(
                  child: Text("launch map"),
                  onPressed: () {
                    setState(() {
                      _launch = _launchUniversalLinkAndroid(
                          'https://www.google.com/maps/dir/27.6915771,85.305577/27.39157,85.305577/');
                    });
                  },
                ),
                ElevatedButton(
                  child: Text("Make phone calls"),
                  onPressed: () {
                    setState(() {
                      _launch = _makePhoneCall('tel:9808215115');
                    });
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  child: Text("Make Sms"),
                  onPressed: () {
                    setState(() {
                      _launch = _makePhoneCall('sms:9808215115');
                    });
                  },
                ),
                SizedBox(height: 10),
                FutureBuilder(
                  future: _launch,
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) {
                    if (snapshot.hasError) {
                      return Text('error');
                    } else {
                      return Text('launched');
                    }
                  },
                )
              ],
            ),
          ),
        );
  }
}