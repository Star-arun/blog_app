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

  // tempResponce(){
  // //  OverallData responce = OverallData.fromJson(tempData);
  // //  OverallData responce = OverallData.fromJson(json.decode(json.encode(tempData)));
  //  OverallData responce = OverallData.fromJson(json.decode(tempData));

  //  print("-----------11----${responce.results!.first.createdTime}");
  //  print("-----------11111----${responce.results!.length}");

  //  getResult.value = responce.results!;

  // //  for(var i =0; i< getResult.length; i++){
  // //   print(getResult[i].paragraph
  // //                                               ?.richText?.first.plainText
  // //                                               .toString());
  // //  }

  //  print("---------------${getResult.first.createdTime}");
  //  print("------33---------${getResult.first.paragraph!.richText![6].plainText.toString()}");

  // }

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

    //  print(result.results);
// print("api responce");
//     print(result);
    // getResult.value = result.results!;

    // print(getResult);

    // Welcome result = Welcome.fromJson(await CommonRepo.getUsers());

    // CommonRepo.getUsers(endpoint).then((value){
    // print(value.results);
    // });
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

    // if (response.statusCode == 200) {
    //   final data = json.decode(response.body);
    //   if (data['results'] != null) {

    //       getResult.value = List.from(data['results']);
    //       print(getResult);

    //   }
    // } else {
    //   // Handle error
    //   print('API request failed with status code ${response.statusCode}');
    // }
  }
}
