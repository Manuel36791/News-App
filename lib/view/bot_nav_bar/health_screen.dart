import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_getx_mvvm/model/news_model.dart';
import 'package:news_app_getx_mvvm/view_model/news_view_model.dart';

class HealthScreen extends GetWidget<NewsViewModel> {
  final controller = Get.put(NewsViewModel());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getData('health'),
      builder: (context, AsyncSnapshot snapshot) {
        NewsModel data = snapshot.data;

        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: data.articles?.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150.0,
                    child: Image.network(
                      data.articles![index].urlToImage.toString(),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    data.articles![index].title.toString(),
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    data.articles![index].description.toString(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
