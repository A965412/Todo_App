import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/provider%20model.dart';
import 'package:todo_app/Setting_tab/modebottomsheet.dart';
import 'package:todo_app/mytheme.dart';

import 'languagebottomsheet.dart';

class setting_tab extends StatefulWidget {
  const setting_tab({super.key});

  @override
  State<setting_tab> createState() => _setting_tabState();
}

class _setting_tabState extends State<setting_tab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfic>(context);
    return Container(
      margin: EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
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
              showlanguageBottomsheet();
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                  color: provider.isDark()
                      ? Mytheme.primarydarkcolorbar
                      : Mytheme.whiteycolor,
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.LanguageApp == "en"
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: provider.isDark()
                          ? Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Mytheme.whiteycolor)
                          : Theme.of(context).textTheme.titleMedium),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Text(
            AppLocalizations.of(context)!.mode,
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
              showmodeBottomsheet();
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                  color: provider.isDark()
                      ? Mytheme.primarydarkcolorbar
                      : Mytheme.whiteycolor,
                  borderRadius: BorderRadius.circular(15)),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.isDark()
                          ? AppLocalizations.of(context)!.dark_mode
                          : AppLocalizations.of(context)!.light_mode,
                      style: provider.isDark()
                          ? Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Mytheme.whiteycolor)
                          : Theme.of(context).textTheme.titleMedium),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showmodeBottomsheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        context: context,
        builder: (context) => modebottomsheet());
  }

  void showlanguageBottomsheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        context: context,
        builder: (context) => Lanbottomsheet());
  }
}
