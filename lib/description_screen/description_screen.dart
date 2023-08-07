import 'package:blog_app/description_screen/description_screen_controller.dart';
import 'package:blog_app/home_screen/home_screen_controller.dart';
import 'package:blog_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DescriptionController>();

    final homeController = Get.find<HomeScreenController>();

    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: SizedBox(
                    height: 24.sp,
                    width: 24.sp,
                    child: Image.asset(
                      "assets/images/arrow-left.png",
                    )))),
        body: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Obx(() {
            return controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(20.sp, 10.sp, 20.sp, 10),
                            child: Text(
                                // 'When Stars Come Knocking: Prepare for Unforgettable Experience',
                                controller.getResult[1].paragraph?.richText![0]
                                        .plainText
                                        .toString() ??
                                    "",
                                style: Styles.medium15Bld),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(right: 10.0.sp, bottom: 10.sp),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    final Uri url = controller
                                                .paramsValue.value ==
                                            "(Star)"
                                        ? Uri.parse(controller.getResult[18]
                                            .video!.imageExternal!.url
                                            .toString())
                                        : Uri.parse(
                                            'https://www.google.com/search?q=sorry+no+url+image&tbm=isch&ved=2ahUKEwiIgPi8hsqAAxXPxKACHVCfDfwQ2-cCegQIABAA&oq=sorry+no+url+image&gs_lcp=CgNpbWcQA1DrAVirEmD4E2gBcAB4AIABqgGIAcsIkgEDMC44mAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=q6DQZMj-Es-Jg8UP0L624A8&bih=603&biw=1280#imgrc=5BhfnVl8RlClqM');
                                    if (!await launchUrl(url)) {
                                      throw Exception('Could not launch $url');
                                    }
                                  },
                                  child: SizedBox(
                                      height: 45.sp,
                                      width: 45.sp,
                                      child: Image.asset(
                                        "assets/images/Group.png",
                                        fit: BoxFit.cover,
                                      )),
                                )
                              ],
                            ),
                          ),

                          controller.getResult[3].image != null
                              ? SizedBox(
                                  // color: Colors.amber,
                                  height: 240.sp,
                                  width: 1.sw,
                                  child: ClipRRect(
                                    child: CachedNetworkImage(
                                        imageUrl: controller
                                                .getResult[3].image?.file?.url
                                                ?.toString() ??
                                            "",
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                              "assets/images/Rectangl8.png",
                                              fit: BoxFit.fill,
                                            ),
                                        fit: BoxFit.fill),
                                  ),
                                )
                              : const SizedBox(),
                          //===========================
                          SizedBox(
                            height: 10.sp,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(20.sp, 10, 20.sp, 10.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    // 'Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.',
                                    controller.getResult[6].paragraph
                                            ?.richText![0].plainText
                                            .toString() ??
                                        "",
                                    style: Styles.normal),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                Text(
                                    // 'Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.',

                                    controller.paramsValue.value == "(Star)"
                                        ? controller.getResult[13].paragraph
                                                ?.richText![0].plainText
                                                .toString() ??
                                            ""
                                        : controller.getResult[7].paragraph
                                                ?.richText![0].plainText
                                                .toString() ??
                                            "",
                                    style: Styles.normal),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                Text(
                                    // 'Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.',

                                    controller.paramsValue.value == "(Star)"
                                        ? controller.getResult[15].paragraph
                                                ?.richText![0].plainText
                                                .toString() ??
                                            ""
                                        : controller.getResult[8].paragraph
                                                ?.richText![0].plainText
                                                .toString() ??
                                            "",
                                    style: Styles.normal),
                                SizedBox(
                                  height: 10.sp,
                                ),
                                Text(
                                    // 'Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.',

                                    controller.paramsValue.value == "(Star)"
                                        ? controller.getResult[16].paragraph
                                                ?.richText![0].plainText
                                                .toString() ??
                                            ""
                                        : controller.getResult[12].paragraph
                                                ?.richText![0].plainText
                                                .toString() ??
                                            "",
                                    style: Styles.normal),
                                controller.paramsValue.value != "(Star)"
                                    ? Column(
                                        children: [
                                          SizedBox(
                                            height: 10.sp,
                                          ),
                                          Text(
                                              // 'Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.',

                                              controller.getResult[13].paragraph
                                                      ?.richText![0].plainText
                                                      .toString() ??
                                                  "",
                                              style: Styles.normal),
                                          SizedBox(
                                            height: 10.sp,
                                          ),
                                          Text(
                                              // 'Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.',

                                              controller.getResult[14].paragraph
                                                      ?.richText![0].plainText
                                                      .toString() ??
                                                  "",
                                              style: Styles.normal),
                                          SizedBox(
                                            height: 10.sp,
                                          ),
                                          Text(
                                              // 'Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla. Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.Lorem ipsum dolor sit amet consectetur. Nulla mi faucibus nam faucibus adipiscing nec tempor mauris nulla.',

                                              controller.getResult[15].paragraph
                                                      ?.richText![0].plainText
                                                      .toString() ??
                                                  "",
                                              style: Styles.normal)
                                        ],
                                      )
                                    : const SizedBox(),
                                SizedBox(
                                  height: 30.sp,
                                ),
                                Text('Recommended', style: Styles.recommended),
                                SizedBox(
                                  height: 30.sp,
                                ),
                                SizedBox(
                                    height: 310.sp,
                                    width: 1.sw,
                                    // color: Colors.red,
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            recommanded(
                                                homeController.getResult[3]
                                                        .image?.file?.url
                                                        ?.toString() ??
                                                    "",
                                                homeController
                                                        .getResult[4]
                                                        .paragraph
                                                        ?.richText
                                                        ?.first
                                                        .plainText
                                                        .toString() ??
                                                    "",
                                                homeController
                                                        .getResult[5]
                                                        .paragraph
                                                        ?.richText
                                                        ?.first
                                                        .plainText
                                                        .toString() ??
                                                    ""),
                                            recommanded(
                                                homeController.getResult[8]
                                                        .image?.file?.url
                                                        ?.toString() ??
                                                    "",
                                                homeController
                                                        .getResult[9]
                                                        .paragraph
                                                        ?.richText
                                                        ?.first
                                                        .plainText
                                                        .toString() ??
                                                    "",
                                                homeController
                                                        .getResult[5]
                                                        .paragraph
                                                        ?.richText
                                                        ?.first
                                                        .plainText
                                                        .toString() ??
                                                    ""),
                                          ],
                                        ))),
                                SizedBox(
                                  height: 30.sp,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  );
          }),
        ));
  }

  Widget recommanded(img, heading, datetime) {
    // final homeController = Get.find<HomeScreenController>();

    return Padding(
      padding: EdgeInsets.only(right: 20.0.sp),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: 200.sp,
          //  color: Colors.yellow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200.sp,
                width: 200.sp,
                child: ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl:
                        // homeController.getResult[3].image?.file?.url?.toString() ??
                        //     "",
                        img,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Image.asset(
                      "assets/images/Rectangl8.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                // 'Beyond the Horizon: A Journey to the Edge of the Cosmos',
                // homeController.getResult[4].paragraph?.richText?.first.plainText
                //       .toString() ??
                //   "",
                heading,
                maxLines: 3,
                style: Styles.recommended,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 10.sp,
              ),
              Text(
                // 'July 12, 2023 8 min read',
                // homeController.getResult[5].paragraph?.richText?.first.plainText
                //       .toString() ??
                //   "",
                datetime,
                style: Styles.normal,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
