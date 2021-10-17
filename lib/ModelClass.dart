import 'dart:convert';

import 'package:http/http.dart' as http;

class GithubData {
  String login;
  String bio;
  String logo;
  String nbrepos;
  GithubData({this.login, this.bio, this.logo, this.nbrepos});

  factory GithubData.fromJson(Map<String, dynamic> json) {
    return GithubData(
        login: json['login'],
        bio: json['bio'],
        nbrepos: json['public_repos'].toString(),
        logo: json['avatar_url']);
  }
  Future<GithubData> fromGit(String username) async {
    final response = await http.get('https://api.github.com/users/' + username);
    if (response.statusCode == 200) {
      return GithubData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("No data available");
    }
  }
}
