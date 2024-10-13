import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_cashing/models/todoDM.dart';
import 'package:todo_cashing/ui/providers/list_provider.dart';

import '../utils/app_color.dart';
import '../utils/app_theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoWidget extends StatefulWidget {
  final Todo todo ;
  const ToDoWidget({super.key , required this.todo});

  @override
  State<ToDoWidget> createState() => _ToDoWidgetState();
}

class _ToDoWidgetState extends State<ToDoWidget> {
  late ListProvider listProvider;
  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of(context);
    return Slidable(
      direction: Axis.horizontal,
      startActionPane: ActionPane(
        extentRatio: 0.4,
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_){
              listProvider.deleteTodo();
            },
            label: "Delete",
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            padding: EdgeInsets.all(2),

          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: AppColors.White,
        ),
        padding: EdgeInsets.symmetric(horizontal:18, vertical:24 ),
        margin: EdgeInsets.symmetric(horizontal: 30 , vertical: 22),
        child: Row(
          children: [
            Container(
              height: 62,
              width: 5,
              decoration: BoxDecoration(
                color:  AppColors.lightBlue,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                     widget.todo.task,
                    style: AppTheme.lightContentTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5,),
                  Text(widget.todo.description , style: AppTheme.lightTimingContent,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8 , horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: AppColors.lightBlue,
              ),
              child: Icon(Icons.check , size: 30, color: AppColors.White,) ,
            ),
          ],
        ),
      ),
    );
  }
}
