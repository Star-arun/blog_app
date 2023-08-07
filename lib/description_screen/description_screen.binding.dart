
import 'package:get/get.dart';

import 'description_screen_controller.dart';

class DescriptionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put(DescriptionController());
  }

}