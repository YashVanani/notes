import 'dart:convert';

class NotesDetail {
  int? id;
  String? title;
  String? topic;
  String? content;
  String? tags;
  String? references;

  NotesDetail({
    this.id,
    this.title,
    this.topic,
    this.content,
    this.tags,
    this.references,

  });


  List<NotesDetail> NotesDetailFromJson(String str) =>
      List<NotesDetail>.from(json.decode(str).map((x) => NotesDetail.fromJson(x)));

  String NoteDatailToJson(List<NotesDetail> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


  NotesDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    topic = json['topic'];
    content = json['content'];
    tags = json['tags'];
    references = json['references'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['topic'] = topic;
    data['content'] = content;
    data['tags'] = tags;
    data['references'] = references;
    return data;
  }

}