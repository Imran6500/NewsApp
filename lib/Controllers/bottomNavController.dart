import 'package:get/get.dart';

import '../Pages/ArticlePage/articlePage.dart';
import '../Pages/ProfilePage.dart/profilePage.dart';
import '../Pages/home_page.dart';

class BottomNavController extends GetxController {
  RxInt index = 0.obs;

  var pages = [HomePage(), ArticlePage(), ProfilePage()];
}
