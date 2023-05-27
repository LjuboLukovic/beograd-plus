import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';
import '../../model/ticket.dart';
import '../../util/ticket_util.dart';

class TicketsList extends StatelessWidget {
  List<Ticket> tickets;

  TicketsList(this.tickets, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: tickets.isEmpty
          ? const Text(
              'Nema tiketa za izabranu zonu',
              textAlign: TextAlign.center,
            )
          : ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: tickets.length,
              itemBuilder: (context, int index) =>
                  buildCard(context, tickets[index])),
    );
  }

  Widget buildCard(BuildContext context, Ticket ticket) {
    final Uri smsLaunchUri = Uri(
      scheme: 'sms',
      path: SMS_NUMBER,
      queryParameters: <String, String>{
        'body': Uri.encodeComponent(ticket.smsText),
      },
    );
    return Card(
        // color: getColorFromZone(ticket.zone),
        margin: const EdgeInsets.only(left: 16, bottom: 8, right: 16, top: 8),
        child: InkWell(
          // When the user taps the button, show a snackbar.
          onTap: () {
            canLaunchUrl(smsLaunchUri).then((canLaunch) {
              if (canLaunch) {
                launchUrl(smsLaunchUri);
              } else {
                SnackBar snackBar = const SnackBar(
                    content: Text('Dozvolite pristup SMS aplikaciji'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.sms),
                    Text(
                      '  ${ticket.smsText}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  getLabelFromType(ticket.type),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  getDescriptionFromType(ticket.type),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Cena: ${ticket.price} RSD',
                          textAlign: TextAlign.end,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )))
              ],
            ),
          ),
        ));
  }
}
