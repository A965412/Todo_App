import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home_page/addbottomsheet.dart';
import 'package:todo_app/Provider/provider%20model.dart';

import '../List_tab/List_tab.dart';
import '../Setting_tab/settingTab.dart';
import '../mytheme.dart';

class HomePage extends StatefulWidget {
  static const String route_name = "home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int Currentselect = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfic>(context);
    return Scaffold(
      backgroundColor:
          provider.isDark() ? Mytheme.primarydarkcolor : Mytheme.primarycolor,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        title: Text(
          AppLocalizations.of(context)!.to_do_list,
          style: provider.isDark()
              ? Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Mytheme.primarydarkcolor)
              : Theme.of(context).textTheme.titleLarge,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: BottomNavigationBar(
          backgroundColor: provider.isDark()
              ? Mytheme.primarydarkcolorbar
              : Mytheme.whiteycolor,
          onTap: (index) {
            Currentselect = index;
            setState(() {});
          },
          currentIndex: Currentselect,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome_mosaic),
              label: AppLocalizations.of(context)!.list,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color:
                    provider.isDark() ? Mytheme.whiteycolor : Mytheme.graycolor,
                size: 30,
              ),
              label: AppLocalizations.of(context)!.setting,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showaddbottomsheet();
        },
        child: const Icon(
          Icons.add,
          size: 33,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Tabs[Currentselect],
    );
  }

  List<Widget> Tabs = [
    List_Tab(),
    setting_tab(),
  ];

  void showaddbottomsheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Mytheme.primarycolor, width: 4),
            borderRadius: BorderRadius.circular(15)),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => addbottomsheet());
  }
}
