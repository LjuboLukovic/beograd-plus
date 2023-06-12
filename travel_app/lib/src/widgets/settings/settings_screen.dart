import 'dart:io';
import 'package:beograd_plus/src/widgets/settings/zone_tabs.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../util/uri_utils.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String? version;
  String? buildNumber;

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((packageInfo) {
      setState(() {
        version = packageInfo.version;
        buildNumber = packageInfo.buildNumber;
      });
    });
  }

  void checkAndLaunchUri(Uri uri) {
    canLaunchUrl(uri).then((canLaunch) {
      if (canLaunch) {
        launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        SnackBar snackBar = const SnackBar(
            content: Text('Zabranili ste otvaranje linkova iz aplikacije!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  void openUrl(String host, String path) {
    final Uri emailLaunchUri = Uri(
      scheme: 'https',
      host: host,
      path: path,
    );
    checkAndLaunchUri(emailLaunchUri);
  }

  void sendEmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sakalsoftware5@gmail.com',
      query: encodeQueryParameters(
          <String, String>{'subject': 'Kontakt', 'body': 'Napisite poruku...'}),
    );
    checkAndLaunchUri(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Podešavanja')),
        body: ListView(
          shrinkWrap: true,
          children: ListTile.divideTiles(context: context, tiles: [
            const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: Text('Zona'))),
            const Padding(
                padding: EdgeInsets.fromLTRB(4, 16, 4, 16),
                child: Center(
                  child: ZoneTabs(),
                )),
            const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: Text('Aplikacija'))),
            ListTile(
              title: Text('Verzija: v$version ($buildNumber)'),
            ),
            Platform.isIOS
                ? ListTile(
                    title: const Text('App Store'),
                    onTap: () => openUrl(
                        'apps.apple.com', 'app/rs.beogradplus.travelApp'),
                  )
                : ListTile(
                    title: const Text('Play Store'),
                    onTap: () => openUrl(
                        'market://details?id=rs.beogradplus.travel_app', ''),
                  ),
            const Padding(
                padding: EdgeInsets.all(16),
                child: Center(child: Text('O nama'))),
            ListTile(
              title: const Text('Vebsajt'),
              onTap: () => openUrl('beogradplus.rs', ''),
            ),
            ListTile(
              title: const Text('Email kontakt'),
              onTap: () => sendEmail(),
            ),
          ]).toList(),
        ));
  }
}
