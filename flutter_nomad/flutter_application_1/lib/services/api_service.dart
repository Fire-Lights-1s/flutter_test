import 'dart:convert';

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
}
