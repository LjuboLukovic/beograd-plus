import 'package:beograd_plus/src/model/city_zone.dart';
import 'package:flutter/material.dart';

const List<Widget> zones = <Widget>[Text('A'), Text('B'), Text('C (A+B)')];

class ZoneChooser extends StatefulWidget {
  CityZone currentZone;
  Function? zoneSelected;

  ZoneChooser(this.currentZone, this.zoneSelected, {Key? key})
      : super(key: key);

  @override
  State<ZoneChooser> createState() => _ZoneChooserState();
}

class _ZoneChooserState extends State<ZoneChooser> {
  List<bool>? _selectedZones;

  @override
  void initState() {
    _selectedZones = [
      CityZone.A == widget.currentZone,
      CityZone.B == widget.currentZone,
      CityZone.C == widget.currentZone
    ];
    super.initState();
  }

  void zonePressed(int index, bool update) {
    if (widget.zoneSelected != null && update) {
      if (index == 2) {
        widget.zoneSelected!(CityZone.C);
      } else if (index == 1) {
        widget.zoneSelected!(CityZone.B);
      } else {
        widget.zoneSelected!(CityZone.A);
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
    if (_selectedZones == null) return const Text('Loading City Zones');
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
