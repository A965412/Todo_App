import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Firebasefile.dart';
import 'package:todo_app/mytheme.dart';

import '../Provider/provider model.dart';
import '../model/Task.dart';

class listview_item extends StatelessWidget {
  Task task;

  listview_item({required this.task});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfic>(context);

    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        children: [
          Slidable(
            startActionPane: ActionPane(
              extentRatio: 0.25,
              motion: const DrawerMotion(),
              children: [
                SlidableAction(
                    borderRadius: BorderRadius.circular(18),
                    onPressed: (context) {
                      Firebase.deletetask(task)
                          .timeout(Duration(milliseconds: 200), onTimeout: () {
                        print("DOne");
                        provider.getAlltasksFromFireStore();
                      });
                    },
                    backgroundColor: Mytheme.redcolor,
                    foregroundColor: Mytheme.whiteycolor,
                    icon: Icons.delete,
                    label: AppLocalizations.of(context)!.delete),
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: provider.isDark()
                      ? Mytheme.primarydarkcolorbar
                      : Mytheme.whiteycolor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Mytheme.bluecolor,
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: 4,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 30, color: Mytheme.bluecolor),
                      ),
                      Text(
                        task.desc ?? " ",
                        style: provider.isDark()
                            ? Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Mytheme.whiteycolor)
                            : Theme.of(context).textTheme.titleMedium!.copyWith(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Mytheme.blackcolor),
                      )
                    ],
                  )),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 21),
                    decoration: BoxDecoration(
                        color: Mytheme.bluecolor,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.check,
                      size: 30,
                      color: Mytheme.whiteycolor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
