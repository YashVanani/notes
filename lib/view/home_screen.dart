import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:praticetask/controller/topic_controller.dart';
import 'package:praticetask/utils/AppColor.dart';

import 'topic_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final topicController = Get.put(TopicsController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Color textColor = AppColor.priceColorUp;
    Color iconColor = Colors.black;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        title: Text("Topic List"),
      ),
      body: bulidItemList(size, textColor, iconColor),
    );
  }

  bulidItemList(Size sizes, Color textColor, Color iconColor) {
    return Obx(() => topicController.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio: 14 / 11,
            ),
            itemCount: topicController.itemList.length,
            itemBuilder: (context, i) {
              // textColor = (itemController.itemList[i].amountRange.toString().contains("-") ? Colors.red : Colors.green);
              // iconColor = itemController.itemList[i].color;
              final itemList = topicController.itemList[i];
              return GestureDetector(
                onTap: () {
                  var topicId = topicController.itemList[i].id;
                  Get.to(() => TopicDetailScreen(), arguments: [topicId]);
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 25, 5, 0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                          // width: MediaQuery.of(context).size.width * .05,
                          height: MediaQuery.of(context).size.height * 0.6,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 5,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(right: 10, top: 10),
                                  // alignment: AlignmentDirectional.topEnd,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        topicController.itemList[i].owner.toString(),
                                        style: TextStyle(fontStyle: FontStyle.italic, color: AppColor.titleColor),
                                      ),
                                      Text(
                                          textAlign: TextAlign.right,
                                          topicController.itemList[i].name.toString(),
                                          style: TextStyle(
                                              fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.subTitleColor)),
                                      SizedBox(height: MediaQuery.of(context).size.height * .02),
                                      Divider(height: 0,endIndent: 22,indent: 25),
                                    ],
                                  ),
                                ),
                              ),
                              // Container(
                              //   padding: EdgeInsets.only(left: 20, right: 20, bottom: 15),
                              //   child: Column(
                              //     children: [
                              //       const Divider(
                              //         color: AppColor.descriptionColor,
                              //       ),
                              //       Row(
                              //         children: [
                              //           Text(
                              //             controller.itemList[i].amountRange,
                              //             style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                              //           ),
                              //           SizedBox(
                              //             width: 5,
                              //           ),
                              //           Text(controller.itemList[i].profitDescription,
                              //               style: TextStyle(color: AppColor.descriptionColor, fontSize: 12)),
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              // )
                            ],
                          )),
                      Positioned(
                        left: 20,
                        top: -15,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Card(
                            elevation: 10,
                            color: iconColor,
                            child: const Center(
                                child: Icon(
                              Icons.add,
                              color: Colors.white,
                            )
                                //     child: Image.network(controller.itemList[i].image.toString(),
                                //         fit: BoxFit.cover) ??
                                //     Icon(
                                //       Icons.add,
                                //   color: Colors.white,
                                // )
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
