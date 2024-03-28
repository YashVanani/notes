import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praticetask/controller/notes_detail_controller.dart';
import 'package:praticetask/utils/AppColor.dart';

class NotesDetailScreen extends StatefulWidget {
  @override
  State<NotesDetailScreen> createState() => _NotesDetailScreenState();
}

class _NotesDetailScreenState extends State<NotesDetailScreen> {
  final notesDetailController = Get.put(NotesDetailController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Topic Details'),
        ),
        body: NotesDetails(size));
  }

  NotesDetails(Size size) {
    return Obx(() => notesDetailController.isLoading.value
        ? Center(child: CircularProgressIndicator())
        : Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
              decoration: BoxDecoration(
                color: AppColor.descriptionColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                        notesDetailController.notesList.value.tags.toString(),
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColor.subTitleColor)),
                  ),
                  Divider(
                    color: AppColor.whiteColor,
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Topic: " + notesDetailController.notesList.value.topic.toString(),
                            style: TextStyle(fontStyle: FontStyle.normal, color: AppColor.blackColor),
                          ),
                          Text(
                            "Content: " + notesDetailController.notesList.value.content.toString(),
                            style: TextStyle(
                              color: AppColor.blackColor,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Title: " + notesDetailController.notesList.value.title.toString(),
                              style: TextStyle(color: AppColor.blackColor)),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            "references: " + notesDetailController.notesList.value.references.toString(),
                            style: TextStyle(color: AppColor.blackColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ));
  }
}
