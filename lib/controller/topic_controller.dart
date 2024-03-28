import 'dart:convert';

import 'package:get/get.dart';
import 'package:praticetask/model/topics.dart';
import 'package:http/http.dart' as http;
import 'package:praticetask/utils/api_constants.dart';

import 'package:flutter_test/flutter_test.dart';

class TopicsController extends GetxController {
  var itemList = <TopicsList>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchTopicList();

    super.onInit();
  }

  // void fetchItem() {
  //   var itemResult = [
  //     TopicsList(
  //         id: 1,
  //         title: "Today's Money",
  //         content: 'Health',
  //         amountRange: "+55%",
  //         icon: Icons.add,
  //         color: Colors.black,
  //         profitDescription: 'then last week',
  //         references:
  //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  //         createdAt: DateTime(2020, 02, 12, 15, 5, 6)),
  //     TopicsList(
  //         id: 2,
  //         title: "Today's User",
  //         content: 'physic',
  //         amountRange: "+6%",
  //         icon: Icons.person,
  //         color: Colors.green,
  //         profitDescription: 'then last month',
  //         references:
  //             "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
  //         createdAt: DateTime(2021, 10, 13, 11, 12, 6)),
  //     TopicsList(
  //         id: 3,
  //         title: "New Client",
  //         content: 'job',
  //         amountRange: "-60%",
  //         icon: Icons.print,
  //         color: Colors.blue,
  //         profitDescription: 'then yesterday',
  //         references:
  //             "From its medieval origins to the digital era, learn everything there is to know about the ubiquitous lorem ipsum passage.",
  //         createdAt: DateTime(2022, 08, 14, 15, 16, 6)),
  //     TopicsList(
  //         id: 4,
  //         title: "Today's Money",
  //         content: 'Health',
  //         amountRange: "+55%",
  //         icon: Icons.add,
  //         color: Colors.black,
  //         profitDescription: 'then last week',
  //         references:
  //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  //         createdAt: DateTime(2023, 07, 15, 24, 12, 6)),
  //     TopicsList(
  //         id: 5,
  //         title: "Today's User",
  //         content: 'physic',
  //         amountRange: "+6%",
  //         icon: Icons.person,
  //         color: Colors.green,
  //         profitDescription: 'then last month',
  //         references:
  //             "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
  //         createdAt: DateTime(2024, 06, 16, 15, 12, 6)),
  //     TopicsList(
  //         id: 6,
  //         title: "New Client",
  //         content: 'job',
  //         amountRange: "-60%",
  //         icon: Icons.print,
  //         color: Colors.blue,
  //         profitDescription: 'then yesterday',
  //         references:
  //             "From its medieval origins to the digital era, learn everything there is to know about the ubiquitous lorem ipsum passage.",
  //         createdAt: DateTime(2020, 08, 17,12, 21, 6)),
  //     TopicsList(
  //         id: 7,
  //         title: "Today's Money",
  //         content: 'Health',
  //         amountRange: "+55%",
  //         icon: Icons.add,
  //         color: Colors.black,
  //         profitDescription: 'then last week',
  //         references:
  //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  //         createdAt: DateTime(2021, 05, 18, 17, 6, 6)),
  //     TopicsList(
  //         id: 8,
  //         title: "Today's User",
  //         content: 'physic',
  //         amountRange: "+6%",
  //         icon: Icons.person,
  //         color: Colors.green,
  //         profitDescription: 'then last month',
  //         references:
  //             "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
  //         createdAt: DateTime(2022, 04, 19, 21, 55, 6)),
  //     TopicsList(
  //         id: 9,
  //         title: "New Client",
  //         content: 'job',
  //         amountRange: "-60%",
  //         icon: Icons.print,
  //         color: Colors.blue,
  //         profitDescription: 'then yesterday',
  //         references:
  //             "From its medieval origins to the digital era, learn everything there is to know about the ubiquitous lorem ipsum passage.",
  //         createdAt: DateTime(2023, 03, 20, 22, 55, 6)),
  //     TopicsList(
  //         id: 10,
  //         title: "Today's Money",
  //         content: 'Health',
  //         amountRange: "+55%",
  //         icon: Icons.add,
  //         color: Colors.black,
  //         profitDescription: 'then last week',
  //         references:
  //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  //         createdAt: DateTime(2024, 11, 21, 14, 52, 6)),
  //     TopicsList(
  //         id: 11,
  //         title: "Today's User",
  //         content: 'physic',
  //         amountRange: "+6%",
  //         icon: Icons.person,
  //         color: Colors.green,
  //         profitDescription: 'then last month',
  //         references:
  //             "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
  //         createdAt: DateTime(2021, 12, 22, 5, 2, 6)),
  //     TopicsList(
  //         id: 12,
  //         title: "New Client",
  //         content: 'job',
  //         amountRange: "-60%",
  //         icon: Icons.print,
  //         color: Colors.blue,
  //         profitDescription: 'then yesterday',
  //         references:
  //             "From its medieval origins to the digital era, learn everything there is to know about the ubiquitous lorem ipsum passage.",
  //         createdAt: DateTime(2022, 05, 23, 5, 2, 6)),
  //     TopicsList(
  //         id: 13,
  //         title: "Today's Money",
  //         content: 'Health',
  //         amountRange: "+55%",
  //         icon: Icons.add,
  //         color: Colors.black,
  //         profitDescription: 'then last week',
  //         references:
  //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  //         createdAt: DateTime(2023, 04, 24, 5, 2, 6)),
  //     TopicsList(
  //         id: 14,
  //         title: "Today's User",
  //         content: 'physic',
  //         amountRange: "+6%",
  //         icon: Icons.person,
  //         color: Colors.green,
  //         profitDescription: 'then last month',
  //         references:
  //             "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
  //         createdAt: DateTime(2024, 06, 25, 5, 2, 6)),
  //     TopicsList(
  //         id: 15,
  //         title: "New Client",
  //         content: 'job',
  //         amountRange: "-60%",
  //         icon: Icons.print,
  //         color: Colors.blue,
  //         profitDescription: 'then yesterday',
  //         references:
  //             "From its medieval origins to the digital era, learn everything there is to know about the ubiquitous lorem ipsum passage.",
  //         createdAt: DateTime(2020, 10, 26, 5, 2, 6)),
  //     TopicsList(
  //         id: 16,
  //         title: "Today's Money",
  //         content: 'Health',
  //         amountRange: "+55%",
  //         icon: Icons.add,
  //         color: Colors.black,
  //         profitDescription: 'then last week',
  //         references:
  //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  //         createdAt: DateTime(2024, 05, 27, 5, 2, 6)),
  //     TopicsList(
  //         id: 17,
  //         title: "Today's User",
  //         content: 'physic',
  //         amountRange: "+6%",
  //         icon: Icons.person,
  //         color: Colors.green,
  //         profitDescription: 'then last month',
  //         references:
  //             "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
  //         createdAt: DateTime(2023, 02, 28, 5, 2, 6)),
  //     TopicsList(
  //         id: 18,
  //         title: "New Client",
  //         content: 'job',
  //         amountRange: "-60%",
  //         icon: Icons.print,
  //         color: Colors.blue,
  //         profitDescription: 'then yesterday',
  //         references:
  //             "From its medieval origins to the digital era, learn everything there is to know about the ubiquitous lorem ipsum passage.",
  //         createdAt: DateTime(2022, 05, 29, 5, 2, 6)),
  //     TopicsList(
  //         id: 19,
  //         title: "Today's Money",
  //         content: 'Health',
  //         amountRange: "+55%",
  //         icon: Icons.add,
  //         color: Colors.black,
  //         profitDescription: 'then last week',
  //         references:
  //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
  //         createdAt: DateTime(2022, 08, 30, 5, 2, 6)),
  //     TopicsList(
  //         id: 20,
  //         title: "Today's User",
  //         content: 'physic',
  //         amountRange: "+6%",
  //         icon: Icons.person,
  //         color: Colors.pinkAccent,
  //         profitDescription: 'then last month',
  //         references:
  //             "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.",
  //         createdAt: DateTime(2020, 09, 31, 5, 2, 6)),
  //     TopicsList(
  //         id: 21,
  //         title: "New Client",
  //         content: 'job',
  //         amountRange: "-60%",
  //         icon: Icons.print,
  //         color: Colors.green,
  //         profitDescription: 'then yesterday',
  //         references:
  //             "From its medieval origins to the digital era, learn everything there is to know about the ubiquitous lorem ipsum passage.",
  //         createdAt: DateTime(2024, 07, 20, 5, 2, 6)),
  //   ];
  //   itemList.value = itemResult;
  // }

  Future<void> fetchTopicList() async {
    try {
      test('API test', () async {
      isLoading(true);

      final response = await http.get(Uri.parse(ApiConstants.BASE_URL + "${ApiConstants.topicsUrl}"));
      final jsonData = response.body;
      expect(response.statusCode, 200);
      expect(jsonData, isNotEmpty);

      if (response.statusCode == 200) {
        isLoading(false);
        List<dynamic> data = jsonDecode(response.body);
        List<TopicsList> topicList = data.map((json) => TopicsList.fromJson(json)).toList();
        itemList.assignAll(topicList);
      } else {
        isLoading(false);
        throw Exception('Failed to load TopicList Data');
      }
      });
    } catch (e) {
      isLoading(false);
      print('Error fetching TopicList Data: $e');
    }
  }
}
