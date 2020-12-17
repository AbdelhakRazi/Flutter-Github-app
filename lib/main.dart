import 'package:flutter/material.dart';
import 'package:github_api/HomePage.dart';
import 'package:github_api/ModelClass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RealHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Future<GithubData> fetchData;
  void initState() {
    super.initState();
  }

  String username = null;
  Widget build(BuildContext context) {
    return FutureBuilder<GithubData>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            backgroundColor: Colors.black,
            extendBodyBehindAppBar: true,
            body: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    onSubmitted: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: username,
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 20)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Align(
                    alignment: Alignment(0, 0),
                    child: CircleAvatar(
                      maxRadius: 50,
                      child: Image.network(
                        snapshot.data.logo,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Align(
                    alignment: Alignment(0, 0),
                    child: Text(snapshot.data.login,
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  Flexible(
                    child: Text('Description:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold)),
                  ),
                  Flexible(
                    child: Text(snapshot.data.bio,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: Colors.white, fontSize: 17)),
                  ),
                  Text('Repositiries Numbers:' + snapshot.data.nbrepos,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            // This trailing comma makes auto-formatting nicer for build methods.
          );
        } else {
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    onSubmitted: (value) {
                      setState(() {
                        username = value;
                        print(username);
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter a username',
                        hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 20)),
                  ),
                )
              ],
            ),

            // This trailing comma makes auto-formatting nicer for build methods.
          );
        }
      },
      future: GithubData().fromGit(username),
    );
  }
}
