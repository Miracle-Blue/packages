import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_todo_service/models/post_model.dart';

class HttpService {
  static String BASE = "6209f31f92946600171c5604.mockapi.io";

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };

  // * Http Apis
  static String API_LIST = "/api/v1/notes";
  static String API_CREATE = "/api/v1/notes";
  static String API_UPDATE = "/api/v1/notes/"; //{id}
  static String API_DELETE = "/api/v1/notes/"; //{id}

  // * Http Requests
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // * Http Params
  static Map<String, String> paramsEmpty() => {};

  static Map<String, String> paramsCreate(Post post) => {
        'title': post.title!,
        'body': post.body!,
        'userId': post.userId.toString(),
      };

  static Map<String, String> paramsUpdate(Post post) => {
        'id': post.id.toString(),
        'title': post.title!,
        'body': post.body!,
        'userId': post.userId.toString(),
      };

  // * Http Parsing
  static List<Post> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Post>.from(json.map((x) => Post.fromJson(x)));
    return data;
  }
}
