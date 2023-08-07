import 'package:blog_app/description_screen/description_screen.binding.dart';
import 'package:blog_app/home_screen/home_screen.dart';
import 'package:blog_app/home_screen/home_screen_binding.dart';
import 'package:blog_app/route_names.dart';
import 'package:blog_app/search_screen/search_screen.dart';
import 'package:blog_app/search_screen/search_screen_binding.dart';
import 'package:get/get.dart';

import 'description_screen/description_screen.dart';

class Routes {
  static List<GetPage<dynamic>> routes = [
    GetPage(
        name: RoutesName.homeScreen,
        page: () => const HomeScreen(),
        binding: HomeScreenBinding()),
    GetPage(
        transition: Transition.fadeIn,
        name: RoutesName.descriptionScreen,
        page: () => const DescriptionScreen(),
        binding: DescriptionBinding()),
    GetPage(
        transition: Transition.fadeIn,
        name: RoutesName.searchScreen,
        page: () => const SearchScreen(),
        binding: SearchScreenBinding()),
  ];
}
