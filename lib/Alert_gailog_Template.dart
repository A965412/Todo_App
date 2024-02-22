import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static void showloading(
      {bool isDismissible = true,
      required BuildContext context,
      required String massege}) {
    showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  width: 15,
                ),
                Text(massege)
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showmassege(
      {required BuildContext context,
      bool isdismissible = true,
      String? title,
      String? posActionName,
      Function? posAction,
      String? negActionName,
      Function? negAction,
      required String massege}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (posAction != null) {
              posAction.call();
            }
          },
          child: Text(posActionName)));
    }
    if (negActionName != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (negAction != null) {
              negAction.call();
            }
          },
          child: Text(negActionName)));
    }
    showDialog(
        barrierDismissible: isdismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Text(massege),
              title: Text(
                title ?? " ",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
              actions: actions);
        });
  }
}
