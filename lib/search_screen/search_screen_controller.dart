import 'package:blog_app/model/newModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SearchScreenController extends GetxController{

  RxList<Result> getResultSearch = <Result>[].obs;


  Rx<TextEditingController> searchController = TextEditingController().obs;

  RxString image = "".obs;
  RxString heading = "".obs;
  RxString content = "".obs;
  RxString dateandTime = "".obs;

  RxBool onchange = false.obs;
  RxBool isLoading = false.obs;

}