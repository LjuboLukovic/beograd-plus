import 'package:beograd_plus/src/widgets/zone_chooser.dart';
import 'package:flutter/material.dart';
import 'util/preference_utils.dart';
import 'widgets/help/help_screen.dart';
import 'widgets/settings/settings_screen.dart';
import 'widgets/tickets_list.dart';
import 'constants.dart';
import 'model/city_zone.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CityZone currentZone = CityZone.A;

  void setCurrentZone(CityZone zone) {
    setState(() => currentZone = zone);
    PreferenceUtils.setString('default_zone', CityZoneToString[zone]!)
        .then((value) => print('Zone selected'));
  }

  void initialize() {
    PreferenceUtils.init().then((preferences) {
      String defaultZone = PreferenceUtils.getString('default_zone', 'A');
      setState(
          () => currentZone = CityZoneFromString[defaultZone] ?? CityZone.A);
    });
  }

  @override
  void initState() {
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.help),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpScreen()),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(top: 16)),
            const Text('Zona\n'),
            ZoneChooser(currentZone, setCurrentZone),
            TicketsList(PRICE_LIST[currentZone]!)
          ],
        )));
  }
}
