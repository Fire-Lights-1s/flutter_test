import 'dart:convert';

import 'package:flutter_application_1/models/webtoon_detail_model.dart';
import 'package:flutter_application_1/models/webtoon_episode_model.dart';
import 'package:flutter_application_1/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev/";
  static const String today = "today";

  //비동기 함수(async)에서 반환 값이 있으려면 Future타입을 달아야함
  static Future<List<Webtoonmodel>> getTodaysToons() async {
    List<Webtoonmodel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl$today');
    final respone = await http.get(url);
    //성공여부 확인
    if (respone.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(respone.body);

      for (var webtoon in webtoons) {
        webtoonInstances.add(Webtoonmodel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesId(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl$id/episodes");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
