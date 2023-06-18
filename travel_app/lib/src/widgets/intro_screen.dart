import 'dart:convert';
import 'dart:io';
import 'package:beograd_plus/src/api/api_config.dart';
import 'package:beograd_plus/src/model/app_info.dart';
import 'package:beograd_plus/src/widgets/home/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      return HomePage(title: AppLocalizations.of(context)!.title);
    }
    return Scaffold(
        body: Center(
            child: Column(
      children: isThisVersionDeprecated
          ? [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                    AppLocalizations.of(context)!.introLoading,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.redAccent)),
              ),
              const CircularProgressIndicator()
            ]
          : [
              Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(AppLocalizations.of(context)!.loading)),
              const CircularProgressIndicator()
            ],
    )));
  }
}
