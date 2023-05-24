import 'package:beograd_plus/src/constants.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Pomoć')),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Zone\n\n',
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.start,
                      ),
                      Center(
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.75,
                              child: Image.asset(
                                "assets/images/bg_zone.png",
                                fit: BoxFit.contain,
                              ))),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      Text(
                        'Zona A\n\n',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                      ...ZONE_A_MUNICIPALITIES
                          .map((municipality) => Text('\u2022 $municipality')),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      Text(
                        'Zona B\n\n',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                      ...ZONE_B_MUNICIPALITIES
                          .map((municipality) => Text('\u2022 $municipality')),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      Text(
                        'Zona C (A+B)\n\n',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                      ...ZONE_C_MUNICIPALITIES
                          .map((municipality) => Text('\u2022 $municipality')),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                    ]))));
  }
}
