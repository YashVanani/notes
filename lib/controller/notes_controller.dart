import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:praticetask/model/notes.dart';
import 'package:praticetask/utils/api_constants.dart';
import 'package:flutter_test/flutter_test.dart';

class NotesController extends GetxController {
  var notesList = <NotesList>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    var topicId = Get.arguments;
    fetchNotesList(topicId[0].toString());
    super.onInit();
  }

  Future<void> fetchNotesList(String topicId) async {
    try {
      // test('API test NotesList', () async {
      isLoading(true);
      final response = await http.get(Uri.parse(ApiConstants.BASE_URL + "${ApiConstants.topicUrl}" + topicId + '/'+ "${ApiConstants.notesUrl}"));
      // final jsonData = response.body;
      // expect(response.statusCode, 200);
      // expect(jsonData, isNotEmpty);

      if (response.statusCode == 200) {
        isLoading(false);
        List<dynamic> data = jsonDecode(response.body);
        List<NotesList> noteList = data.map((json) => NotesList.fromJson(json)).toList();
        notesList.assignAll(noteList);
      } else {
        isLoading(false);
        throw Exception('Failed to load Notes Data');
      }
      // });
    } catch (e) {
      isLoading(false);
      print('Error fetching Notes Data: $e');
    }
  }
}
