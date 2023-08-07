import 'package:blog_app/home_screen/home_screen_controller.dart';
import 'package:blog_app/route_names.dart';
import 'package:blog_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'search_screen_controller.dart';

class SearchScreen extends GetView<SearchScreenController> {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeScreenController>();

    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 216, 195, 195), borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Obx(() {
                  return TextFormField(
                    controller: controller.searchController.value,
                    onChanged: (value) {
                      controller.isLoading.value = true;
                      for (var i = 0; i < homeController.getResult.length; i++) {
            if (homeController.getResult[i].paragraph != null &&  homeController.getResult[i].paragraph!.richText!.isNotEmpty &&
                homeController.getResult[i].paragraph!.richText!.first.plainText
                    .toString()
                    .toLowerCase()
                    .contains(controller.searchController.value.text.toLowerCase())) {
              controller.heading.value = homeController.getResult[i].paragraph!.richText![0].plainText.toString();
              print(controller.heading.value);
              controller.content.value = homeController.getResult[i].paragraph!.richText![0].plainText.toString();
              controller.dateandTime.value = homeController.getResult[i].paragraph!.richText![0].plainText.toString();
              controller.image.value = homeController.getResult[i].image?.file?.url ?? "";
                controller.isLoading.value = false;
              break; // Break the loop after finding the first match
            } else {
              // Reset your controller values if no match is found
              controller.heading.value = "";
              controller.content.value = "";
              controller.dateandTime.value = "";
              controller.image.value = "";
                controller.isLoading.value = false;

            }
          }
                      
                    },
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                          
                           controller.searchController.value.clear();
                          },
                        ),
                        hintText: 'Search...',
                        border: InputBorder.none),
                  );
                }),
              )),
        ),
        body: Obx(
           () {
            return  controller.isLoading.value ? const Center(child: CircularProgressIndicator()) :SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: controller.searchController.value.text.isNotEmpty
                    ? dashboardWidget()
                    : const Text('')
            
            );
          }
        ));
  }

  Widget dashboardWidget() {
    final controller = Get.find<SearchScreenController>();

    return Padding(
      padding: EdgeInsets.fromLTRB(20.sp, 10.sp, 20.sp, 0),
      child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  var value = {"IndexOF": "Star"};
                  Get.toNamed(
                    RoutesName.descriptionScreen,
                    parameters: value,
                  );
                },
                child: SizedBox(
                  height: 200.sp,
                  child: CachedNetworkImage(
                    imageUrl: controller.image.value,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/Rectangl8.png"),
                  ),
                )),
            SizedBox(
              height: 20.sp,
            ),
            Text(controller.heading.value, style: Styles.medium15Bld),
            SizedBox(
              height: 10.sp,
            ),
            // Text(controller.content.value, style: Styles.normal),
            // SizedBox(
            //   height: 10.sp,
            // ),
            // Text(controller.dateandTime.value, style: Styles.normal),
            SizedBox(
              height: 40.sp,
            ),
          ],
        );
      }),
    );
  }
}
