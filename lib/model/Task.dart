import 'dart:core';

class Task {
  static const String collectionname = "Task";
  String? title;
  String? desc;
  DateTime? date;
  String? id;
  bool? isdone;

  Task(
      {this.id = " ",
      this.isdone = false,
      required this.title,
      required this.date,
      required this.desc});

  Task.fromJson(Map<String, dynamic> json)
      : this(
            title: json['title'] as String?,
            desc: json['desc'] as String?,
            date: DateTime.fromMillisecondsSinceEpoch(json['date']),
            id: json['id'] as String?,
            isdone: json['isdone'] as bool?);

  Map<String, dynamic?> toJson() {
    return {
      'title': title,
      'desc': desc,
      'date': date?.millisecondsSinceEpoch,
      'id': id,
      'isdone': isdone,
    };
  }
}
