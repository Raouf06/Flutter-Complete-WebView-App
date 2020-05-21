import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:mypartyapp/webview.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String status = '';
  void checkStatus () async {
    final response =
      await http.head('https://my-party.fr/');
    if (response.statusCode != 200) {
      setState(() {status = "Impossible d'accéder au site, \n Veuillez réessayer dans un moment";});
    }else {
      Route route = MaterialPageRoute(builder: (context) => WebviewClass());
      Navigator.pushReplacement(context, route);
    }
  }

  void checkNet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        this.checkStatus();
      }
    } on SocketException catch (_) {
      setState(() {status= "Impossible d'établir une connexion a internet";});
    }
  }

  @override
  void initState() {
    this.checkNet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              ),
              SizedBox(height:10),
              Text(
                '$status',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'CaviarDreams',
                  fontWeight: FontWeight.w800
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

