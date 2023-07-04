import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:beograd_plus/src/constants.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.help)),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Poslali ste poruku, ali Vam stiže odgovor: "Ova usluga Vam nije omogućena"\n',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Morate kontaktirati Vašeg mobilnog operatera i proveriti sa njima, verovatno vam je zabranjeno slanje poruka na četvorocifrene brojeve.\n',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                                            Text(
                        'Imate reklamaciju za kupovinu karte preko SMS poruke\n',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Pošaljite email sa detaljima na mobile@comtrade.com.\n',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        AppLocalizations.of(context)!.zones,
                        style: Theme.of(context).textTheme.titleMedium,
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
                        AppLocalizations.of(context)!.zoneA + '\n\n',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                      ...ZONE_A_MUNICIPALITIES
                          .map((municipality) => Text('\u2022 $municipality')),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      Text(
                        AppLocalizations.of(context)!.zoneB + '\n\n',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                      ...ZONE_B_MUNICIPALITIES
                          .map((municipality) => Text('\u2022 $municipality')),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      Text(
                        AppLocalizations.of(context)!.zoneC + '\n\n',
                        style: Theme.of(context).textTheme.bodyLarge,
                        textAlign: TextAlign.start,
                      ),
                      ...ZONE_C_MUNICIPALITIES
                          .map((municipality) => Text('\u2022 $municipality')),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                    ]))));
  }
}
