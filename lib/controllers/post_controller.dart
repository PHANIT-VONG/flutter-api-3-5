import 'dart:convert';
import 'package:flutter_api_3_5/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostController {
  Future<List<PostModel>> fetchData() async {
    const url = 'https://jsonplaceholder.typicode.com/posts/';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String jsonString = response.body;
      return postModelFromJson(jsonString);
    } else {
      return throw Exception('Some went wrong');
    }
  }

  Future<PostModel> createPost(PostModel postModel) async {
    const url = 'https://jsonplaceholder.typicode.com/posts/';
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=utf-8'},
      body: jsonEncode(postModel.toJson()),
    );
    if (response.statusCode == 201) {
      var resJson = jsonDecode(response.body);
      return PostModel.fromJson(resJson);
    } else {
      return throw Exception('Some went wrong');
    }
  }
}
