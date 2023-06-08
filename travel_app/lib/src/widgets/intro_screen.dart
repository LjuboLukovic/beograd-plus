import 'dart:convert';
import 'dart:io';
import 'package:beograd_plus/src/api/api_config.dart';
import 'package:beograd_plus/src/model/app_info.dart';
import 'package:beograd_plus/src/widgets/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:package_info_plus/package_info_plus.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  bool isLoading = true;
  bool isThisVersionDeprecated = false;

  @override
  void initState() {
    super.initState();
    Future.wait([
      PackageInfo.fromPlatform(),
      fetchConfig(Platform.isIOS ? 'ios.json' : 'android.json')
    ]).then((futures) {
      PackageInfo packageInfo = futures[0] as PackageInfo;
      Response configResponse = futures[1] as Response;
      if (configResponse.statusCode == 200) {
        AppInfo appInfo = AppInfo.fromJson(jsonDecode(configResponse.body));
        if (appInfo.minAppBuildNumner > num.parse(packageInfo.buildNumber)) {
          setState(() => isThisVersionDeprecated = true);
        }
      }
      setState(() => isLoading = false);
    }).catchError((err) {
      print(err);
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoading && !isThisVersionDeprecated) {
      return const HomePage(title: 'Beograd+ Karte');
    }
    return Scaffold(
        body: Center(
            child: Column(
      children: isThisVersionDeprecated
          ? const [
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text(
                    'Morate ažurirate aplikaciju da biste nastavili, jer je došlo do nekih kritičnih promena.',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.redAccent)),
              ),
              CircularProgressIndicator()
            ]
          : const [
              Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Text('Aplikacija se učitava. Molimo sačekajte...')),
              CircularProgressIndicator()
            ],
    )));
  }
}
