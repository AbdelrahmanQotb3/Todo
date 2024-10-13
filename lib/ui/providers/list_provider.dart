import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models/todoDM.dart';

class ListProvider extends ChangeNotifier {
  List<Todo> todos = [];
  DateTime SelectedDate = DateTime.now();

  onDateSelected(DateTime newSelectedDate) {
    SelectedDate = newSelectedDate;
    refreshTodos();
    notifyListeners();
  }

  deleteTodo() async {
    CollectionReference todoCollection = FirebaseFirestore.instance.collection(Todo.collectionName);
    todoCollection
        .doc("")
        .delete()
        .then((value) => print("todo Deleted"))
        .catchError((error) => print("failed to delete"));
    refreshTodos();
    notifyListeners();
  }

  refreshTodos() async {
    todos.clear();
    CollectionReference todoCollection = FirebaseFirestore.instance.collection(Todo.collectionName);
    QuerySnapshot querySnapshot = await todoCollection.get();
    List<QueryDocumentSnapshot<Object?>> documenList = querySnapshot.docs;
    for (QueryDocumentSnapshot doc in documenList) {
      Map json = doc.data() as Map;
      Timestamp dateAsTimeStamp = json["Date"];
      Todo todo = Todo(
          id: json["Id"],
          task: json["Task"],
          description: json["Description"],
          isDone: json["isDone"],
          time: dateAsTimeStamp.toDate());
      if (SelectedDate.year == todo.time.year &&
          SelectedDate.month == todo.time.month &&
          SelectedDate.day == todo.time.day) {
        todos.add(todo);
      }
    }
    // setState(() {
    //
    // });
    notifyListeners();
  }
}
