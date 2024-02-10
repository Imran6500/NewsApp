import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/news_model.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trendingNewsList = RxList<NewsModel>();
  RxList<NewsModel> newsForYouList = RxList<NewsModel>();
  RxList<NewsModel> onlyNewsForYouList = RxList<NewsModel>();
  RxList<NewsModel> appleNewsForYouList = RxList<NewsModel>();
  RxList<NewsModel> appleOnlyNewsForYouList = RxList<NewsModel>();
  RxList<NewsModel> teslaNewsForYouList = RxList<NewsModel>();
  RxList<NewsModel> teslaOnlyNewsForYouList = RxList<NewsModel>();
  RxList<NewsModel> bussinessNewsForYouList = RxList<NewsModel>();
  RxList<NewsModel> bussinessOnlyNewsForYouList = RxList<NewsModel>();
  RxBool isTrendingNewsLoading = false.obs;
  RxBool isNewsForYouLoading = false.obs;
  RxBool isAppleNewsLoading = false.obs;
  RxBool isTeslaNewsLoading = false.obs;
  RxBool isbussinessNewsLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTrendingNews();
    getNewsForYou();
    getAppleNews();
    getTeslaNews();
    getBussinessNews();
  }

//trending news
  Future<void> getTrendingNews() async {
    isTrendingNewsLoading.value = true;
    try {
      const String baseUrl =
          "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=05a278b07e61445d91c5e049773a3f51";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          trendingNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print("something went wrong!");
      }
    } catch (e) {
      print("error $e");
    }
    isTrendingNewsLoading.value = false;
  }

//news for you
  Future<void> getNewsForYou() async {
    isNewsForYouLoading.value = true;
    try {
      const String baseUrl =
          "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=05a278b07e61445d91c5e049773a3f51";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          newsForYouList.add(NewsModel.fromJson(news));
        }
        onlyNewsForYouList.value = newsForYouList.sublist(0, 5).obs;
      } else {
        print("something went wrong!");
      }
      // update();
      // print(newsForYouList);
    } catch (e) {
      print("error $e");
    }
    isNewsForYouLoading.value = false;
  }

//apple news
  Future<void> getAppleNews() async {
    isAppleNewsLoading.value = true;
    try {
      const String baseUrl =
          "https://newsapi.org/v2/everything?q=apple&from=2024-02-04&to=2024-02-04&sortBy=popularity&apiKey=05a278b07e61445d91c5e049773a3f51";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          appleNewsForYouList.add(NewsModel.fromJson(news));
        }
        appleOnlyNewsForYouList.value = appleNewsForYouList.sublist(0, 5).obs;
      } else {
        print("something went wrong!");
      }
      // update();
      // print(newsForYouList);
    } catch (e) {
      print("error $e");
    }
    isAppleNewsLoading.value = false;
  }

// tesla news
  Future<void> getTeslaNews() async {
    isTeslaNewsLoading.value = true;
    try {
      const String baseUrl =
          "https://newsapi.org/v2/everything?q=tesla&from=2024-01-05&sortBy=publishedAt&apiKey=05a278b07e61445d91c5e049773a3f51";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          teslaNewsForYouList.add(NewsModel.fromJson(news));
        }
        teslaOnlyNewsForYouList.value = teslaNewsForYouList.sublist(0, 5).obs;
      } else {
        print("something went wrong!");
      }
      // update();
      // print(newsForYouList);
    } catch (e) {
      print("error $e");
    }
    isTeslaNewsLoading.value = false;
  }

//bussiness news
  Future<void> getBussinessNews() async {
    isbussinessNewsLoading.value = true;
    try {
      const String baseUrl =
          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=05a278b07e61445d91c5e049773a3f51";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articles = body["articles"];
        for (var news in articles) {
          bussinessNewsForYouList.add(NewsModel.fromJson(news));
        }
        bussinessOnlyNewsForYouList.value =
            bussinessNewsForYouList.sublist(0, 5).obs;
      } else {
        print("something went wrong!");
      }
      // update();
      // print(newsForYouList);
    } catch (e) {
      print("error $e");
    }
    isbussinessNewsLoading.value = false;
  }
}
