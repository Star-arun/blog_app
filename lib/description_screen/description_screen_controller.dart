import 'dart:convert';

import 'package:blog_app/common_repo.dart';
import 'package:blog_app/model/description_data.dart';
import 'package:get/get.dart';

class DescriptionController extends GetxController {
  RxList<Result> getResult = <Result>[].obs;

  Map<String, dynamic>? params;
  RxString paramsValue = "".obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    print("call onInit"); // this line not printing

    params = Get.parameters;
    paramsValue.value = params!.values.toString();

    await descriptionDataAPICall();

    super.onInit();
  }

  descriptionDataAPICall() async {
    isLoading.value = true;

    // DescriptionData responce =
    //   DescriptionData.fromJson(json.decode(paramsValue.value == "(Star)" ? descriptionData : secondDescription));
    DescriptionData responce = DescriptionData.fromJson(json.decode(paramsValue
                .value ==
            "(Star)"
        ? json.encode(await CommonRepo.getAPI(
            "https://api.notion.com/v1/blocks/8e33620175f74a4e8ed84f5abc23f616/children?page_size=200"))
        : json.encode(await CommonRepo.getAPI(
            "https://api.notion.com/v1/blocks/e703c23f32544f15901f9ad53e47c74a/children?page_size=200"))));

    if (responce.results!.isNotEmpty) {
      getResult.value = responce.results!;
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }
}
