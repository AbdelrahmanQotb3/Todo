import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String id;
  String task;
  String description;
  bool isDone;
  DateTime time;
  static String collectionName = "todo";

  Todo(
      {required this.id,
      required this.task,
      required this.description,
      required this.isDone,
      required this.time});
}
