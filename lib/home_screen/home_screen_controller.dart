import 'dart:convert';

import 'package:blog_app/common_repo.dart';
import 'package:blog_app/model/newModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomeScreenController extends GetxController {
  RxList<Result> getResult = <Result>[].obs;

  RxBool isLoading = false.obs;

  String endpoint =
      'https://api.notion.com/v1/blocks/e45f355a4cb442fab0c22521e88912ec/children?page_size=200';

  @override
  void onInit() async {
    print("call onInit"); // this line not printing

    await dashboardApi();
    // await fetchBlocks();

    // tempResponce();

    super.onInit();
  }

  dashboardApi() async {
    isLoading.value = true;
    // Temperatures result = Temperatures.fromJson(await CommonRepo.getAPI(
    //     "https://api.notion.com/v1/blocks/e45f355a4cb442fab0c22521e88912ec/children?page_size=200"));
    OverallData result = OverallData.fromJson(json.decode(json.encode(
        await CommonRepo.getAPI(
            "https://api.notion.com/v1/blocks/e45f355a4cb442fab0c22521e88912ec/children?page_size=200"))));

    if (result.results!.isNotEmpty) {
      getResult.value = result.results!;
      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  //==============

  Future<void> fetchBlocks() async {
    final response = await get(
      Uri.parse(
        'https://api.notion.com/v1/blocks/e45f355a4cb442fab0c22521e88912ec/children?page_size=200',
      ),
      headers: {
        'Notion-Version': '2022-02-22',
        'Authorization':
            'Bearer secret_6FUwEepND9KKRbw6SUxYailRLqVEMbsnhs5DgQxzIQ3',
        // Specify the Notion API version
      },
    );

    print(response.body);
  }
}
