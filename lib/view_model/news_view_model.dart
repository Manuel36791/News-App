import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_getx_mvvm/model/news_model.dart';

class NewsViewModel extends GetxController {
  getData(String category) async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=02d28b7e7cca463db6d873fd657e94f9');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        return NewsModel.fromjson(jsonDecode(response.body));
      } catch (Error) {
        Get.snackbar('Can\'t get data', Error.toString());
      }
    }
  }
}
