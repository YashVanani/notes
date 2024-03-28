import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:praticetask/controller/notes_controller.dart';
import 'package:praticetask/controller/notes_detail_controller.dart';
import 'package:praticetask/view/notes_detail_screen.dart';
import '../utils/AppColor.dart';

class NotesScreen extends StatefulWidget {
  var topicId = "0";

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final notesController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Notes List"),
      ),
      body: FetchNotesItemData(size),
    );
  }

  FetchNotesItemData(Size sizes) {
    print("test :" + Get.arguments[0].toString());
    final double itemHeight = (MediaQuery.of(context).size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = MediaQuery.of(context).size.width / 2;
    final aspectSize = itemWidth / itemHeight;

    return Obx(() => notesController.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: notesController.notesList.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        var notesId = notesController.notesList[i].id;
                        Get.to(() => NotesDetailScreen(), arguments: [
                          {"topicId": Get.arguments[0].toString()},
                          {"notesId": notesId}
                        ]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                        child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.descriptionColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                  alignment: AlignmentDirectional.topStart,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(notesController.notesList[i].tags.toString(),
                                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.subTitleColor)),
                                      SizedBox(height: 5),
                                      Text(
                                          textAlign: TextAlign.right,
                                          notesController.notesList[i].title.toString(),
                                          style: TextStyle(color: AppColor.whiteColor,fontSize: 17)),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    );
                  }),
            ),
          ));
  }
}
