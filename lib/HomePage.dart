import 'package:flutter/material.dart';
import 'package:github_api/main.dart';

class RealHome extends StatefulWidget {
  @override
  _RealHomeState createState() => _RealHomeState();
}

class _RealHomeState extends State<RealHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text('Choose a method to search a user',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          ButtonTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            minWidth: MediaQuery.of(context).size.width / 2,
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MyHomePage()));
                },
                textColor: Colors.black,
                color: Colors.yellow,
                child: Text('By Username',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20))),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          ButtonTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            minWidth: MediaQuery.of(context).size.width / 2,
            child: RaisedButton(
                onPressed: () {},
                textColor: Colors.black,
                color: Colors.yellow,
                child: Text('By email', style: TextStyle(fontSize: 20))),
          ),
        ],
      ),
    );
  }
}
