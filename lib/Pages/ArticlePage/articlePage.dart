import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_apk/Controllers/news_controller.dart';

import '../NewsDetailsPage/newsDetails.dart';
import '../Wigets/news_tile.dart';
import 'widgets/searchWidget.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            const SearchWidget(),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Column(
                children: newsController.onlyNewsForYouList
                    .map((e) => NewsTile(
                        ontap: () {
                          Get.to(() => NewsDetails(news: e));
                        },
                        imageUrl: e.urlToImage ??
                            "https://akm-img-a-in.tosshub.com/indiatoday/imagesstarlink-245233-16x9.jpg?VersionId=7Ff5PXgCKVk9oCqts7ssize=690:388",
                        title: e.title!,
                        time: e.publishedAt!,
                        auther: e.author ?? "Unknown"))
                    .toList()))
          ],
        ),
      ),
    ));
  }
}
