import 'package:blog_app/home_screen/home_screen_controller.dart';
import 'package:get/get.dart';


class HomeScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<HomeScreenController>(HomeScreenController());
  }
}