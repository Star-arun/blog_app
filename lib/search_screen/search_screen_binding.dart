
import 'package:blog_app/search_screen/search_screen_controller.dart';
import 'package:get/get.dart';

class SearchScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<SearchScreenController>(SearchScreenController());
  }
}