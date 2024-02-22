import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Provider/provider%20model.dart';
import 'package:todo_app/mytheme.dart';

class modebottomsheet extends StatefulWidget {
  const modebottomsheet({super.key});

  @override
  State<modebottomsheet> createState() => _modebottomsheetState();
}

class _modebottomsheetState extends State<modebottomsheet> {
  late Appconfic provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<Appconfic>(context);
    return Container(
      height: 150,
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.changemode(ThemeMode.dark);
              },
              child: provider.isDark()
                  ? getSelected(AppLocalizations.of(context)!.dark_mode)
                  : unGetSelected(AppLocalizations.of(context)!.dark_mode)),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                provider.changemode(ThemeMode.light);
              },
              child: provider.appemode == ThemeMode.light
                  ? getSelected(AppLocalizations.of(context)!.light_mode)
                  : unGetSelected(AppLocalizations.of(context)!.light_mode)),
        ],
      ),
    );
  }

  Widget getSelected(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.check,
          size: 35,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget unGetSelected(String text) {
    return Text(
      text,
      style: provider.isDark()
          ? Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Mytheme.blackcolor)
          : Theme.of(context).textTheme.titleSmall,
    );
  }
}
