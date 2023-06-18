import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../util/preference_utils.dart';
import '../help/help_screen.dart';
import '../settings/settings_screen.dart';
import 'tickets_list.dart';
import '../../constants.dart';
import '../../model/city_zone.dart';
import 'selected_zone.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CityZone? currentZone;

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
    const busDecoration = BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/bus_27e.png"),
        opacity: 0.2,
        fit: BoxFit.cover,
      ),
    );
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
              ).then((value) => initialize()),
            )
          ],
        ),
        body: Container(
                decoration: busDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (currentZone != null) ...[
                      SelectedZone(currentZone!, setCurrentZone),
                      const Text('SMS: 9011'),
                      TicketsList(PRICE_LIST[currentZone]!),
                      Text(AppLocalizations.of(context)!.nightRides),
                    ]
                  ],
                )));
  }
}
