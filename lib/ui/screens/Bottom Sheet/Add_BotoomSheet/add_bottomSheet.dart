
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_cashing/models/todoDM.dart';
import 'package:todo_cashing/ui/providers/list_provider.dart';

import '../../../utils/app_theme.dart';


class AddBottomSheet extends StatefulWidget {
   AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  DateTime selectedDate = DateTime.now();
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late ListProvider listProvider;
  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * .45,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add new Task",textAlign: TextAlign.center ,style: AppTheme.lightMediumTitleTextStyle,),
          TextField(
            controller: taskController,
            decoration: InputDecoration(
              labelText: "Enter Task",

            ),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
                labelText: "Enter Description"
            ),
          ),
          SizedBox(height: 20,),
          Text("Select Date" , style: AppTheme.lightRegularTitleTextStyle,),
          InkWell(
              onTap: (){
                showMyDatePicker();
              },
              child: Text("${selectedDate.day}/ ${selectedDate.month}/ ${selectedDate.year}" , textAlign: TextAlign.center, style: AppTheme.lightTimingContent,)),
          Spacer(),
          ElevatedButton(onPressed: (){
            addToDoToFireStore();
          }, child: Text("Add")),

        ],
      ),
    );
  }
  void addToDoToFireStore() {
    CollectionReference todoCollection = FirebaseFirestore.instance.collection(Todo.collectionName);
    DocumentReference doc = todoCollection.doc();
    doc.set({
      "Id" : "",
      "Task" : taskController.text,
      "Description" : descriptionController.text,
      "Date" : selectedDate,
      "isDone" : false
    }).timeout(Duration(milliseconds: 300) ,onTimeout: (){
      listProvider.refreshTodos();
      Navigator.pop(context);
    } );

  }
  void showMyDatePicker() async {
    selectedDate =(await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365))) ?? selectedDate) ;
    setState(() {});
  }


}
