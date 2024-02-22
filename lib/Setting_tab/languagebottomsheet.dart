import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../Provider/provider model.dart';

class Lanbottomsheet extends StatefulWidget {
  const Lanbottomsheet({super.key});

  @override
  State<Lanbottomsheet> createState() => _LanbottomsheetState();
}

class _LanbottomsheetState extends State<Lanbottomsheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Appconfic>(context);

    return Container(
      height: 150,
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.changelanguage("en");
              },
              child: provider.LanguageApp == "en"
                  ? getSelected(AppLocalizations.of(context)!.english)
                  : unGetSelected(AppLocalizations.of(context)!.english)),
          SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                provider.changelanguage("ar");
              },
              child: provider.LanguageApp == "ar"
                  ? getSelected(AppLocalizations.of(context)!.arabic)
                  : unGetSelected(AppLocalizations.of(context)!.arabic)),
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
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
