import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/navigationBar.dart';
import '../Controllers/news_controller.dart';
import 'NewsDetailsPage/newsDetails.dart';
import 'Wigets/news_tile.dart';
import 'Wigets/trending_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  NewsController newsController = Get.put(NewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const MyBottomNav(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color:
                                Theme.of(context).colorScheme.primaryContainer),
                        height: 50,
                        width: 50,
                        child: const Icon(Icons.dashboard)),
                    const Text(
                      "NEWS APP",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                    InkWell(
                      onTap: () {
                        // newsController.getTrendingNews();
                        // print("list: ${newsController.trendingNewsList}");
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer),
                          height: 50,
                          width: 50,
                          child: const Icon(Icons.person)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending News",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(
                      () => newsController.isTrendingNewsLoading.value
                          ? const CircularProgressIndicator()
                          : Row(
                              //method 1
                              children: newsController.trendingNewsList
                                  .map(
                                    (e) => TrendingCard(
                                      ontap: () {
                                        Get.to(() => NewsDetails(
                                              news: e,
                                            ));
                                      },
                                      imageUrl: e.urlToImage ??
                                          "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202401/oneplus-12-19093718-16x9_1.png?VersionId=B7t7EGl.tEOBRwshOhub7KYIqjKkyjen&size=690:388",
                                      title: e.title!,
                                      auther: e.author ?? "Unknown",
                                      time: e.publishedAt!,
                                      firstLetterOfAuther: e.author![0],
                                      tag: "Trending No. 1",
                                    ),
                                  )
                                  .toList()),
                    )),
                //method 2
                // Obx(() {
                //   if (newsController.trendingNewsList.isEmpty) {
                //     return SizedBox();
                //   }
                //   return SizedBox(
                //     height: 355,
                //     child: ListView.builder(
                //       shrinkWrap: true,
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, i) {
                //         return TrendingCard(
                //           ontap: () {
                //             Get.to(() => const NewsDetails());
                //           },
                //           imageUrl: newsController
                //                   .trendingNewsList[i].urlToImage ??
                //               "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202401/oneplus-12-19093718-16x9_1.png?VersionId=B7t7EGl.tEOBRwshOhub7KYIqjKkyjen&size=690:388",
                //           title: newsController.trendingNewsList[i].title ??
                //               "OnePlus 12, Oneplus 12R, Buds3 to launch in a few months",
                //           auther: newsController.trendingNewsList[i].author ??
                //               "Imran Hashimi",
                //           time: "2 Day ago",
                //           tag: "Trending No. 1",
                //         );
                //       },
                //       itemCount: newsController.trendingNewsList.length,
                //     ),
                //   );
                // }),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hottest News",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Obx(
                      () => newsController.isNewsForYouLoading.value
                          ? const CircularProgressIndicator()
                          : Column(
                              children: newsController.onlyNewsForYouList
                                  .map(
                                    (e) => NewsTile(
                                        ontap: () {
                                          Get.to(() => NewsDetails(news: e));
                                        },
                                        imageUrl: e.urlToImage ??
                                            "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202401/starlink-245233-16x9.jpg?VersionId=7Ff5PXgCKVk9oCqts7sk4RNuolfUv31L&size=690:388",
                                        title: e.title!,
                                        time: e.publishedAt!,
                                        auther: e.author ?? "Unknown"),
                                  )
                                  .toList()),
                    )),
                const SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Apple News",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Obx(
                      () => newsController.isAppleNewsLoading.value
                          ? const CircularProgressIndicator()
                          : Column(
                              children: newsController.appleOnlyNewsForYouList
                                  .map(
                                    (e) => NewsTile(
                                        ontap: () {
                                          Get.to(() => NewsDetails(news: e));
                                        },
                                        imageUrl: e.urlToImage ??
                                            "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202401/starlink-245233-16x9.jpg?VersionId=7Ff5PXgCKVk9oCqts7sk4RNuolfUv31L&size=690:388",
                                        title: e.title!,
                                        time: e.publishedAt!,
                                        auther: e.author ?? "Unknown"),
                                  )
                                  .toList()),
                    )),

                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tesla News",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(
                      () => newsController.isTeslaNewsLoading.value
                          ? const CircularProgressIndicator()
                          : Row(
                              //method 1
                              children: newsController.teslaOnlyNewsForYouList
                                  .map(
                                    (e) => TrendingCard(
                                      ontap: () {
                                        Get.to(() => NewsDetails(
                                              news: e,
                                            ));
                                      },
                                      imageUrl: e.urlToImage ??
                                          "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202401/oneplus-12-19093718-16x9_1.png?VersionId=B7t7EGl.tEOBRwshOhub7KYIqjKkyjen&size=690:388",
                                      title: e.title!,
                                      auther: e.author ?? "Unknown",
                                      time: e.publishedAt!,
                                      firstLetterOfAuther: e.author![0],
                                      tag: "Trending No. 1",
                                    ),
                                  )
                                  .toList()),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Bussiness News",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      "See All",
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Obx(
                      () => newsController.isbussinessNewsLoading.value
                          ? const CircularProgressIndicator()
                          : Column(
                              children: newsController
                                  .bussinessOnlyNewsForYouList
                                  .map(
                                    (e) => NewsTile(
                                        ontap: () {
                                          Get.to(() => NewsDetails(news: e));
                                        },
                                        imageUrl: e.urlToImage ??
                                            "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202401/starlink-245233-16x9.jpg?VersionId=7Ff5PXgCKVk9oCqts7sk4RNuolfUv31L&size=690:388",
                                        title: e.title!,
                                        time: e.publishedAt!,
                                        auther: e.author ?? "Unknown"),
                                  )
                                  .toList()),
                    )),
              ],
            ),
          ),
        ));
  }
}
