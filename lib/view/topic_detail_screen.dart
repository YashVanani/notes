import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:praticetask/controller/topic_detail_controller.dart';
import 'package:praticetask/view/notes_screen.dart';
import '../utils/AppColor.dart';

class TopicDetailScreen extends StatefulWidget {
  @override
  State<TopicDetailScreen> createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends State<TopicDetailScreen> {
  final topicDetailController = Get.put(TopicsDetailController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Color textColor = itemData.amountRange.toString().contains("-") ? AppColor.priceColorDown : AppColor.priceColorUp;

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Topic Detils'),
        ),
        body: topicListDetail(size));
  }

  // topicListDetail(){}

  topicListDetail(Size size) {
    return Obx(() => topicDetailController.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : GestureDetector(
          onTap: () {
            var topicId = topicDetailController.topicsList.value.id;
            Get.to(() => NotesScreen(), arguments: [topicId]);
          },
          child: Container(
              // width: double.infinity,
              // height: size.height * .15,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                // boxShadow: [
                //   BoxShadow(
                //     offset: Offset(0, 1),
                //     blurRadius: 10,
                //     color: Colors.blue,
                //   ),
                // ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.red,
                    // radius: 22,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          textAlign: TextAlign.center,
                          topicDetailController.topicsList.value.name.toString(),
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.subTitleColor)),
                      Text(
                        topicDetailController.topicsList.value.owner.toString(),
                        style: TextStyle(color: AppColor.blackColor),
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 50, right: 50, bottom: 0, top: 5),
                  //   child: Divider(
                  //     color: AppColor.whiteColor,
                  //   ),
                  // ),

                  // Container(
                  //     padding: EdgeInsets.only(left: 30, right: 20),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Row(
                  //           children: [
                  //             Text(
                  //               topicData.amountRange,
                  //               style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                  //             ),
                  //             SizedBox(
                  //               width: 5,
                  //             ),
                  //             Text(topicData.profitDescription, style: TextStyle(color: AppColor.descriptionColor)),
                  //           ],
                  //         ),
                  //         SizedBox(height: 10),
                  //         Text(
                  //           overflow: TextOverflow.ellipsis,
                  //           maxLines: 5,
                  //           "Description : " + topicData.references,
                  //           style: TextStyle(fontStyle: FontStyle.italic, color: AppColor.blackColor),
                  //         ),
                  //       ],
                  //     )),

                /*  Container(
                    width: double.infinity,
                    alignment: AlignmentDirectional.topEnd,
                    padding: EdgeInsets.only(right: 15, top: 20),
                    child: Text(
                      textAlign: TextAlign.end,
                      topicDetailController.topicsList.value.created_at.toString(),
                      // DateFormat('yyyy-MM-dd')
                      //     .format(DateTime.parse(topicDetailController.topicsList.value.created_at.toString())),
                      style: TextStyle(fontStyle: FontStyle.normal, color: AppColor.whiteColor),
                    ),
                  ),*/
                ],
              )),
        ));
  }
}
