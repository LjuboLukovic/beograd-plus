import 'package:beograd_plus/src/model/city_zone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'zone_chooser.dart';

const List<String> zones = <String>['A', 'B', 'C (A+B)'];

class SelectedZone extends StatefulWidget {
  CityZone currentZone;
  Function? zoneSelected;
  SelectedZone(this.currentZone, this.zoneSelected, {Key? key})
      : super(key: key);

  @override
  State<SelectedZone> createState() => _SelectedZoneState();
}

class _SelectedZoneState extends State<SelectedZone> {
  String dropdownValue = zones.first;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Padding(padding: EdgeInsets.only(left: 16)),
      Text(
        AppLocalizations.of(context)!.selectedZone,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      const Padding(padding: EdgeInsets.only(right: 8)),
      TextButton(
          style: TextButton.styleFrom(
            primary: Theme.of(context).colorScheme.secondary,
          ),
          onPressed: () async {
            CityZone? newZone = await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0)),
                ),
                builder: (context) => ZoneChooserModal());
            if (newZone != null && newZone != widget.currentZone) {
              widget.zoneSelected!(newZone);
            }
          },
          child: Row(
            children: [
              Text(
                CityZoneToString[widget.currentZone] ?? 'A',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const Padding(padding: EdgeInsets.only(right: 4)),
              const Icon(Icons.change_circle),
              const Padding(padding: EdgeInsets.only(right: 4)),
            ],
          ))
    ]);
  }
}
