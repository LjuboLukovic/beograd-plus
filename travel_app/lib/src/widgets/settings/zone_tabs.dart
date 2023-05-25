import 'package:flutter/material.dart';
import '../../model/city_zone.dart';
import '../../util/preference_utils.dart';

const List<Widget> zones = <Widget>[Text('A'), Text('B'), Text('C (A+B)')];

class ZoneTabs extends StatefulWidget {
  const ZoneTabs({Key? key}) : super(key: key);

  @override
  State<ZoneTabs> createState() => _ZoneTabsState();
}

class _ZoneTabsState extends State<ZoneTabs> {
  List<bool>? _selectedZones;
  CityZone? currentZone;

  void setCurrentZone(CityZone zone) {
    setState(() => currentZone = zone);
    PreferenceUtils.setString('default_zone', CityZoneToString[zone]!)
        .then((value) => print('Zone selected'));
  }

  @override
  void initState() {
    super.initState();
    PreferenceUtils.init().then((preferences) {
      String defaultZone = PreferenceUtils.getString('default_zone', 'A');
      setState(() {
        currentZone = CityZoneFromString[defaultZone] ?? CityZone.A;
        _selectedZones = [
          CityZone.A == currentZone,
          CityZone.B == currentZone,
          CityZone.C == currentZone
        ];
      });
    });
  }

  void zonePressed(int index, bool update) {
    if (update) {
      if (index == 2) {
        setCurrentZone(CityZone.C);
      } else if (index == 1) {
        setCurrentZone(CityZone.B);
      } else {
        setCurrentZone(CityZone.A);
      }
    }
    if (_selectedZones == null || _selectedZones!.isEmpty) {
      return;
    }
    setState(() {
      // The button that is tapped is set to true, and the others to false.
      for (int i = 0; i < _selectedZones!.length; i++) {
        _selectedZones![i] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedZones == null) return const Text('Ucitavanje zona');
    return ToggleButtons(
      direction: Axis.horizontal,
      onPressed: (int index) => zonePressed(index, true),
      constraints: const BoxConstraints(
        minHeight: 40.0,
        minWidth: 80.0,
      ),
      isSelected: _selectedZones!,
      children: zones,
    );
  }
}
