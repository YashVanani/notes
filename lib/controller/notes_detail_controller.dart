import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:praticetask/model/notesdetail.dart';
import 'package:praticetask/utils/api_constants.dart';
import 'package:flutter_test/flutter_test.dart';

class NotesDetailController extends GetxController {
  var isLoading = false.obs;
  late NotesDetail notes;
  Rx<NotesDetail> notesList = NotesDetail().obs;

  @override
  void onInit() {
    var notesId = Get.arguments;

    fetchNotesDetailList(notesId[0]['topicId'].toString(), notesId[1]['notesId'].toString());
    super.onInit();
  }

  Future<NotesDetail> fetchNotesDetailList(String topicId, String notesId) async {
    try {
      // test('API test NotesDetailList', () async {
        isLoading(true);

        final response = await http.get(Uri.parse(ApiConstants.BASE_URL + "${ApiConstants.topicUrl}" + topicId + '/' + "${ApiConstants.noteUrl}" + notesId));
        // final jsonData = response.body;
        // expect(response.statusCode, 200);
        // expect(jsonData, isNotEmpty);

        if (response.statusCode == 200) {
          isLoading(false);
          final data = jsonDecode(response.body);
          notes = NotesDetail.fromJson(data);
          notesList.value = notes;
        } else {
          isLoading(false);
          throw Exception('Failed to load NotesDetail Data');
        }
        return notes;
      // });
    } catch (e) {
      isLoading(false);
      print('Error fetching NotesDetail: $e');
    } finally {
      isLoading(false);
    }
    return notes;
  }
}
