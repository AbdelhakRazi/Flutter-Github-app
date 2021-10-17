import 'package:flutter/material.dart';
import 'package:github_api/Informations.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  TextEditingController controller = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 20),
              enableSuggestions: true,
              decoration: InputDecoration(
                  hintText: 'Enter a username',
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.5), fontSize: 20)),
            ),
          ),
          ButtonTheme(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            minWidth: MediaQuery.of(context).size.width / 2,
            child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => MyHomePage(
                                username: controller.text,
                              )));
                },
                textColor: Colors.black,
                color: Colors.yellow,
                child: Text('Submit',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20))),
          ),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
