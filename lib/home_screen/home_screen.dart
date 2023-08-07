import 'package:blog_app/home_screen/home_screen_controller.dart';
import 'package:blog_app/route_names.dart';
import 'package:blog_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        
        title: Row(
          children: [
            SizedBox(
                height: 35.sp,
                width: 35.sp,
                child: Image.asset(
                  "assets/images/Frame.png",
                )),
            const Spacer(),
            InkWell(
              onTap: (){
                Get.toNamed(RoutesName.searchScreen);
              },
              child: SizedBox(
                  height: 35.sp,
                  width: 35.sp,
                  child: Image.asset(
                    "assets/images/search-normal.png",
                  )),
            ),
          ],
        ),
      ),
      body: Obx(
         () {
          return controller.isLoading.value ? const Center(child: CircularProgressIndicator()) : SizedBox(
            // height: 1.sh,
            width: 1.sw,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.sp, 10.sp, 20.sp, 0),
              child: SingleChildScrollView(
                child: Obx(
                   () {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                           () {
                            return Text(
                           controller.getResult[1].paragraph != null ?   controller.getResult[1].paragraph?.richText?.first.plainText.toString() ??
                                  "" : "",
                              style: Styles.medium,
                            );
                          }
                        ),
                        SizedBox(
                          height: 20.sp,
                        ),
                       dashboardWidget()
                       
                        // Expanded(
                        //   child: SizedBox(
                        //       height: 1.sh, width: 1.sw, child: dashboardWidget()
          
                        //       //                   ListView.builder(
                        //       //                       itemCount: controller.getResult.length,
                        //       //                       scrollDirection: Axis.vertical,
                        //       //                       shrinkWrap: true,
                        //       //                       itemBuilder: ((context, index) {
                        //       //                        print ( "-------cfnfc${controller.getResult[index]}");
                        //       //                         return InkWell(
                        //       //                             onTap: () {
                        //       //                               Get.toNamed(RoutesName.descriptionScreen);
                        //       //                             },
                        //       //                             child:Column(
                        //       //   crossAxisAlignment: CrossAxisAlignment.start,
                        //       //   children: [
                        //       //     controller.getResult[3].image != null
                        //       //         ? SizedBox(
                        //       //             height: 200.sp,
                        //       //             child: Image.network(
                        //       //               controller.getResult[3].image?.file?.url?.toString() ?? "",
                        //       //               fit: BoxFit.fill,
                        //       //             ),
                        //       //           )
                        //       //         : const SizedBox(),
                        //       //     SizedBox(
                        //       //       height: 20.sp,
                        //       //     ),
                        //       //     Text(
                        //       //         controller.getResult[index].paragraph?.richText?[0].plainText
                        //       //                 .toString() ??
                        //       //             "",
                        //       //         style: Styles.medium15Bld),
                        //       //     SizedBox(
                        //       //       height: 10.sp,
                        //       //     ),
                        //       //     Text(
                        //       //         controller.getResult[index].paragraph?.richText?[0].plainText
                        //       //                 .toString() ??
                        //       //             "",
                        //       //         style: Styles.normal),
                        //       //     SizedBox(
                        //       //       height: 10.sp,
                        //       //     ),
                        //       //     Text(
                        //       //         controller.getResult[index].paragraph?.richText?[0].plainText
                        //       //                 .toString() ??
                        //       //             "",
                        //       //         style: Styles.normal),
                        //       //     SizedBox(
                        //       //       height: 40.sp,
                        //       //     ),
                        //       //   ],
                        //       // ));
                        //       //                       })),
                        //       ),
                        // )
                      ],
                    );
                  }
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  Column dashboardWidget() {
    final controller = Get.find<HomeScreenController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: (){
            var value = {"IndexOF":"Star"};
             Get.toNamed(RoutesName.descriptionScreen,parameters: value,);
          },
          child: controller.getResult[3].image != null
              ? SizedBox(
                  height: 200.sp,
                  child: CachedNetworkImage(
                    imageUrl:
                        controller.getResult[3].image?.file?.url?.toString() ??
                            "",
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/Rectangl8.png"),
                  ),
                )
              : const SizedBox(),
        ),
        SizedBox(
          height: 20.sp,
        ),
        Text(
           controller.getResult[4].paragraph != null ? controller.getResult[4].paragraph?.richText?.first.plainText
                    .toString() ??
                "" :"",
            style: Styles.medium15Bld),
        SizedBox(
          height: 10.sp,
        ),
        Text(
          controller.getResult[5].paragraph != null ?    controller.getResult[5].paragraph?.richText?.first.plainText
                    .toString() ??
                "" : "",
            style: Styles.normal),
        SizedBox(
          height: 10.sp,
        ),
        Text(
           controller.getResult[6].paragraph != null ?  controller.getResult[6].paragraph?.richText?.first.plainText
                    .toString() ??
                "" :"",
            style: Styles.normal),
        SizedBox(
          height: 40.sp,
        ),
        InkWell(
          onTap: (){
              var value = {"IndexOF":"Moon"};
             Get.toNamed(RoutesName.descriptionScreen,parameters: value,);
          },
          child: controller.getResult[8].image != null
              ? SizedBox(
                  height: 200.sp,
                  child: CachedNetworkImage(
                    imageUrl:
                        controller.getResult[8].image?.file?.url?.toString() ??
                            "",
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/Rectangl8.png"),
                  ),
                )
              : const SizedBox(),
        ),
        SizedBox(
          height: 20.sp,
        ),
        Text(
           controller.getResult[9].paragraph != null ?  controller.getResult[9].paragraph?.richText?.first.plainText
                    .toString() ??
                "" : "",
            style: Styles.medium15Bld),
        SizedBox(
          height: 10.sp,
        ),
        Text(
           controller.getResult[5].paragraph != null ?  controller.getResult[5].paragraph?.richText?.first.plainText
                    .toString() ??
                "" : "",
            style: Styles.normal),
        SizedBox(
          height: 10.sp,
        ),
        Text(
           controller.getResult[6].paragraph != null ?  controller.getResult[6].paragraph?.richText?.first.plainText
                    .toString() ??
                "" : "",
            style: Styles.normal),
        SizedBox(
          height: 40.sp,
        ),
      ],
    );
  }
}
