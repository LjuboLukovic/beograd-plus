import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../model/city_zone.dart';

class ZoneChooserModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)),
            color: Colors.white,
          ),
          child: Text(
            AppLocalizations.of(context)!.selectZone,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.start,
          ),
        ),
        Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: ListView(
              shrinkWrap: true,
              children: ListTile.divideTiles(context: context, tiles: [
                ListTile(
                  title: const Text('A'),
                  onTap: () => Navigator.pop(context, CityZone.A),
                ),
                ListTile(
                  title: const Text('B'),
                  onTap: () => Navigator.pop(context, CityZone.B),
                ),
                ListTile(
                  title: const Text('C (A+B)'),
                  onTap: () => Navigator.pop(context, CityZone.C),
                ),
              ]).toList(),
            )),
      ]),
    );
  }
}
