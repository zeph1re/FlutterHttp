import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String? name;
  String? job;
  String? id;
  String? createAt;

  PostResult({this.name, this.job, this.id, this.createAt});

  factory PostResult.createPostResult(Map<String, dynamic> json) {
    return PostResult(
        name: json["name"],
        job: json['job'],
        id: json['id'],
        createAt: json['createAt']);
  }

  // Http Post
  static Future<PostResult> connectToAPI(String name, String job) async {
    Uri baseUrl = Uri.parse("https://reqres.in/api/users");

    var apiResult = await http.post(baseUrl, body: {"name": name, "job": job});
    var jsonObject = json.decode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}
