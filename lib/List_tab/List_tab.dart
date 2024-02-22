import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/List_tab/List_View_Item.dart';
import 'package:todo_app/mytheme.dart';

import '../Provider/provider model.dart';

class List_Tab extends StatefulWidget {
  const List_Tab({super.key});

  @override
  State<List_Tab> createState() => _List_TabState();
}

class _List_TabState extends State<List_Tab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfic>(context);
    if (provider.taskslist.isEmpty) {
      provider.getAlltasksFromFireStore();
    }
    return Container(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: provider.isDark()
                      ? Mytheme.primarydarkcolorbar
                      : Mytheme.whiteycolor),
              child: EasyDateTimeLine(
                locale: provider.LanguageApp,
                initialDate: provider.selectedDate,
                onDateChange: (date) {
                  provider.changeselecteddate(date);
                },
                activeColor: Mytheme.bluecolor,
                headerProps: EasyHeaderProps(
                  selectedDateStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: provider.isDark()
                          ? Mytheme.whiteycolor
                          : Mytheme.blackcolor),
                  monthPickerType: MonthPickerType.switcher,
                ),
                dayProps: EasyDayProps(
                  activeDayStyle: DayStyle(
                    borderRadius: 15.0,
                    dayNumStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    dayStrStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    monthStrStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  inactiveDayStyle: DayStyle(
                    dayNumStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: provider.isDark()
                            ? Mytheme.whiteycolor
                            : Mytheme.blackcolor),
                    dayStrStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: provider.isDark()
                            ? Mytheme.whiteycolor
                            : Mytheme.blackcolor),
                    monthStrStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: provider.isDark()
                            ? Mytheme.whiteycolor
                            : Mytheme.blackcolor),
                    borderRadius: 20.0,
                  ),
                ),
                timeLineProps: EasyTimeLineProps(
                  hPadding: 15.0, // padding from left and right
                  separatorPadding: 16.0, // padding between days
                ),
              )),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return listview_item(task: provider.taskslist[index]);
              },
              itemCount: provider.taskslist.length,
            ),
          )
        ],
      ),
    );
  }
}
