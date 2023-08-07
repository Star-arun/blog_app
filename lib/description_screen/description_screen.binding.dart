import 'package:get/get.dart';

import 'description_screen_controller.dart';

class DescriptionBinding extends Bindings {
  @override
  void dependencies() {
   

    Get.put(DescriptionController());
  }
}
