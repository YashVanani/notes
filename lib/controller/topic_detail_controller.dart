import 'dart:convert';
import 'package:get/get.dart';
import 'package:praticetask/model/topics.dart';
import 'package:http/http.dart' as http;
import 'package:praticetask/utils/api_constants.dart';
import 'package:flutter_test/flutter_test.dart';

class TopicsDetailController extends GetxController {
  var isLoading = false.obs;
  late TopicsList topic;
  Rx<TopicsList> topicsList = TopicsList().obs;

  @override
  void onInit() {
    var one = Get.arguments;
    fetchTopicDetailList(one[0].toString());
    super.onInit();
  }

  //Topics Detail
  Future<void> fetchTopicDetailList(String id) async {
    try {
      // test('API test TopicDetailList', () async {
        isLoading(true);

        final response = await http.get(Uri.parse(ApiConstants.BASE_URL + "${ApiConstants.topicUrl}" + id));
        // final jsonData = response.body;
        // expect(response.statusCode, 200);
        // expect(jsonData, isNotEmpty);

        if (response.statusCode == 200) {
          isLoading(false);
          final data = jsonDecode(response.body);
          topic = TopicsList.fromJson(data);
          topicsList.value = topic;
        } else {
          isLoading(false);
          throw Exception('Failed to load TopicDetail Data');
        }
        // return topic;
      // });
    } catch (e) {
      isLoading(false);
      print('Error fetching TopicDetail: $e');
    } finally {
      isLoading(false);
    }
    // return topic;
  }
}
