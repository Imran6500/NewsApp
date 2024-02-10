import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_apk/Model/news_model.dart';

class NewsDetails extends StatelessWidget {
  final NewsModel news;
  const NewsDetails({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Row(
                        children: [Icon(Icons.arrow_back_ios), Text("Back")],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      news.urlToImage ??
                          "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202401/apple-vision-pro-282622397-16x9_1.jpg?VersionId=.IhC1hHb1X55s4tnCpq9Nk2rZEYO5Qzt&size=690:388",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  news.title ??
                      "Know someone working at Apple? Employees will get a 25% discount on Vision Pro headset",
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${news.author} * ${news.publishedAt!}",
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 15,
                      child: Text(
                        news.author![0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      news.author ?? "Unknown",
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  news.description ?? "No Description",
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
