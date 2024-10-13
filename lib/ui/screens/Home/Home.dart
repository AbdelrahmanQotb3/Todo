import 'package:flutter/material.dart';
import 'package:todo_cashing/ui/screens/Home/tabs/list_tab/list_tab.dart';
import 'package:todo_cashing/ui/screens/Home/tabs/settings_tab/settings_tab.dart';
import 'package:todo_cashing/ui/utils/app_color.dart';

import '../../utils/app_theme.dart';
import '../Bottom Sheet/Add_BotoomSheet/add_bottomSheet.dart';

class Home extends StatefulWidget {
  static String routeName = "Home";

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTabIndex = 0;
  List<Widget> tabs = [ListTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.SecondaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "TO-DO",
          style: AppTheme.lightAppBarTextStyle,
        ),
      ),
      body: tabs[currentTabIndex],
      floatingActionButton: buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  FloatingActionButton buildFloatingActionButton() => FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context,
              isScrollControlled: true,
              builder: (context){

                return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: AddBottomSheet());
              });
        } ,
        child: Icon(Icons.add),
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4)),
      );

  Widget buildBottomNavigationBar() => BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.hardEdge,
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          currentIndex: currentTabIndex,
          onTap: (newTabIndex) {
            currentTabIndex = newTabIndex;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Lists"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      );
}
