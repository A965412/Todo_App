import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Alert_gailog_Template.dart';
import 'package:todo_app/Firebasefile.dart';
import 'package:todo_app/model/Task.dart';
import 'package:todo_app/mytheme.dart';

import '../Provider/provider model.dart';

class addbottomsheet extends StatefulWidget {
  const addbottomsheet({super.key});

  @override
  State<addbottomsheet> createState() => _addbottomsheetState();
}

class _addbottomsheetState extends State<addbottomsheet> {
  late Appconfic provider;

  var selecteddate = DateTime.now();
  var formkey = GlobalKey<FormState>();
  String title = " ";
  String description = " ";

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<Appconfic>(context);

    return Container(
      color:
          provider.isDark() ? Mytheme.primarydarkcolorbar : Mytheme.whiteycolor,
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.add_new_task,
            style: provider.isDark()
                ? Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Mytheme.whiteycolor)
                : Theme.of(context).textTheme.titleMedium,
          ),
          Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    onChanged: (text) {
                      title = text;
                    },
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "please enter task title";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintStyle: provider.isDark()
                          ? Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 20,
                                color: Mytheme.whiteycolor,
                              )
                          : Theme.of(context).textTheme.titleSmall!.copyWith(
                                fontSize: 20,
                                color: Mytheme.graycolor,
                              ),
                      hintText: AppLocalizations.of(context)!.enter_task_title,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (text) {
                      description = text;
                    },
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "please enter task description";
                      }
                      return null;
                    },
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintStyle: provider.isDark()
                            ? Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontSize: 20,
                                  color: Mytheme.whiteycolor,
                                )
                            : Theme.of(context).textTheme.titleSmall!.copyWith(
                                  fontSize: 20,
                                  color: Mytheme.graycolor,
                                ),
                        hintText:
                            AppLocalizations.of(context)!.enter_description),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    AppLocalizations.of(context)!.select_time,
                    style: provider.isDark()
                        ? Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Mytheme.whiteycolor)
                        : Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      showCalender();
                      setState(() {});
                    },
                    child: Text(
                      "${selecteddate.day}/${selecteddate.month}/${selecteddate.year}",
                      textAlign: TextAlign.center,
                      style: provider.isDark()
                          ? Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Mytheme.whiteycolor)
                          : Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addTask();
                      },
                      child: Text(
                        AppLocalizations.of(context)!.add,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 20),
                      ))
                ],
              ))
        ],
      ),
    );
  }

  void showCalender() async {
    var chosen = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosen != null) {
      selecteddate = chosen;
      setState(() {});
    }
  }

  void addTask() {
    if (formkey.currentState!.validate() == true) {
      Task task = Task(title: title, date: selecteddate, desc: description);

      Firebase.addtasktofirestore(task).timeout(Duration(seconds: 3),
          onTimeout: () {
        DialogUtils.showloading(
          context: context,
          massege: "Done",
          isDismissible: true,
        );

        provider.getAlltasksFromFireStore();

        Navigator.pop(context);
      });
    }
  }
}
