import 'dart:convert';

List<TestDataModel> testDataModelFromJson(String str) =>
    List<TestDataModel>.from(
        json.decode(str).map((x) => TestDataModel.fromJson(x)));

String testDataModelToJson(List<TestDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestDataModel {
  TestDataModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  TestDataModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) =>
      TestDataModel(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory TestDataModel.fromJson(Map<String, dynamic> json) => TestDataModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}
