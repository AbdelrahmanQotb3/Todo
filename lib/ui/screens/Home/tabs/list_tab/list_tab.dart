
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_cashing/models/todoDM.dart';
import 'package:todo_cashing/ui/providers/list_provider.dart';
import 'package:todo_cashing/ui/utils/app_color.dart';

import '../../../../widgets/to_do_widget.dart';

class ListTab extends StatefulWidget {
  const ListTab({super.key});

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  late ListProvider listProvider;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      listProvider.refreshTodos();
    });

  }
  Widget build(BuildContext context) {
    listProvider = Provider.of(context);
    EasyInfiniteDateTimelineController controller = EasyInfiniteDateTimelineController();
    return Column(
      children: [
        buildCalender(controller),
        Expanded(
            child: ListView.builder(
              itemCount: listProvider.todos.length,
              itemBuilder: (context , index){
                return ToDoWidget(todo: listProvider.todos[index]);
                },
              ))

      ],
    );
  }

  Widget buildCalender(EasyInfiniteDateTimelineController controller) {
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              Expanded(child: Container(color: AppColors.SecondaryColor,)),
              Spacer(),
            ],
          ),
        ),
        EasyInfiniteDateTimeLine(
          controller: controller,

          firstDate: DateTime.now().subtract(Duration(days: 365)),
          focusDate: listProvider.SelectedDate,
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateChange: (selectedDate) {
            listProvider.onDateSelected(selectedDate);
          },
          showTimelineHeader: true,
          dayProps: EasyDayProps(height: MediaQuery.of(context).size.height*0.12) ,
          itemBuilder: (context , date , isSelected ,onTap ){
            return InkResponse(
              onTap: onTap,
              child: Container(
                height:MediaQuery.of(context).size.height*0.09 ,
                width: MediaQuery.of(context).size.width*0.08,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),

                ),
                child: Column(
                  children: [
                    Spacer(),
                    Text("${EasyDateFormatter.shortDayName(date, "en_US")}",
                      style: TextStyle(
                        color: isSelected ? AppColors.SecondaryColor : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                    Spacer(),
                    Text("${date.day.toString()}",
                      style: TextStyle(
                      color: isSelected ? AppColors.SecondaryColor : Colors.black,
                      fontWeight: FontWeight.bold,),),
                    Spacer(),
                  ],
                ),
              ),
            );
          },
          )
      ],
    );
  }

}
