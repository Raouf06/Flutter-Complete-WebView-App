import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebviewClass extends StatefulWidget {
  @override
  _WebviewClassState createState() => _WebviewClassState();
}

class _WebviewClassState extends State<WebviewClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebviewScaffold(
          url: 'https://my-party.fr/',
          withLocalStorage: true,
          initialChild: Container(
            color: Colors.grey[350],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Image.asset('assets/logo.png', width: 100, height: 100),
                  SizedBox(height:20),
                  Text(
                    'My Party',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'CaviarDreams',
                      fontWeight: FontWeight.w800
                    ),
                  )
                ],
              ),
            ),
          )
        )
      ),
    );
  }
}
