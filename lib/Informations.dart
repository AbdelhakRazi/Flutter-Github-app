import 'package:flutter/material.dart';
import 'package:github_api/ModelClass.dart';
import 'package:github_api/Search.dart';

class MyHomePage extends StatefulWidget {
  @override
  String username;
  MyHomePage({this.username});
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Future<GithubData> fetchData;
  GithubData _githubData = new GithubData();
  Widget build(BuildContext context) {
    return FutureBuilder<GithubData>(
        future: _githubData.fromGit(widget.username),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
              ),
              body: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    Align(
                      alignment: Alignment(0, 0),
                      child: CircleAvatar(
                        maxRadius: 50,
                        child: snapshot.data.logo != null
                            ? Image.network(
                                snapshot.data.logo,
                                fit: BoxFit.cover,
                              )
                            : FlutterLogo(),
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
                      child: Text(
                          snapshot.data.bio != null
                              ? snapshot.data.bio
                              : "No bio found",
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
          } else if (snapshot.hasError) {
            return NoUser();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}

class NoUser extends StatelessWidget {
  const NoUser({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "User with this name doesn't exist",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ButtonTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
              minWidth: MediaQuery.of(context).size.width / 2,
              child: RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Search()));
                  },
                  textColor: Colors.black,
                  color: Colors.yellow,
                  child: Text('Re-enter Userame',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20))),
            ),
          ],
        ));
  }
}
