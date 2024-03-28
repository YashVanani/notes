import 'dart:convert';

class NotesList {
  int? id;
  String? title;
  String? tags;

  NotesList({
    this.id,
    this.title,
    this.tags,

  });


  List<NotesList> NotesDataFromJson(String str) =>
      List<NotesList>.from(json.decode(str).map((x) => NotesList.fromJson(x)));

  String NoteDataToJson(List<NotesList> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


  NotesList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['tags'] = tags;
    return data;
  }

}