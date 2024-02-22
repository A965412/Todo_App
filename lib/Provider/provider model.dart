import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Firebasefile.dart';
import '../model/Task.dart';

class Appconfic extends ChangeNotifier {
  String LanguageApp = "en";
  ThemeMode appemode = ThemeMode.light;
  List<Task> taskslist = [];
  DateTime selectedDate = DateTime.now();

  void changelanguage(String newlanguage) {
    if (LanguageApp == newlanguage) {
      return;
    }
    LanguageApp = newlanguage;
    notifyListeners();
  }

  void changemode(ThemeMode newmode) {
    if (appemode == newmode) {
      return;
    }
    appemode = newmode;
    notifyListeners();
  }

  bool isDark() {
    return appemode == ThemeMode.dark;
  }

  void getAlltasksFromFireStore() async {
    QuerySnapshot<Task> querysnapshot = await Firebase.getcollection().get();
    taskslist = querysnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    taskslist = taskslist.where((task) {
      if (selectedDate.day == task.date?.day &&
          selectedDate.month == task.date?.month &&
          selectedDate.year == task.date?.year) {
        return true;
      }
      return false;
    }).toList();

    taskslist.sort((task1, task2) {
      return task1.date!.compareTo(task2.date!);
    });

    notifyListeners();
  }

  void changeselecteddate(DateTime newselected) {
    selectedDate = newselected;
    getAlltasksFromFireStore();
  }
}
