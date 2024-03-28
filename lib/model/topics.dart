import 'dart:convert';

class TopicsList {
  int? id;
  String? name;
  String? image;
  String? owner;
  String? created_at;
  String? updated_at;


  TopicsList({
    this.id,
    this.name,
    this.image,
    this.owner,
    this.created_at,
    this.updated_at,
  });


  List<TopicsList> topicModelFromJson(String str) =>
      List<TopicsList>.from(json.decode(str).map((x) => TopicsList.fromJson(x)));

  String topicModelToJson(List<TopicsList> data) =>
      json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


  TopicsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    owner = json['owner'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['owner'] = owner;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    return data;
  }

}
