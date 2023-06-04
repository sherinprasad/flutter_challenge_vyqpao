import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/music_model.dart';

class HomeApiProvider {
  static Future<dynamic> homePage() async {
    String url;
    url = 'https://itunes.apple.com/us/rss/topalbums/limit=100/json';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
      },
    );
    List<MusicModel> list = [];
    list.add(MusicModel.fromJson(json.decode(response.body.toString())));
    return list;
  }
}
