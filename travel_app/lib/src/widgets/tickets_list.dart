import 'package:beograd_plus/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../util/ticket_util.dart';
import '../model/ticket.dart';

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
          child: ListTile(
            leading: Text(ticket.smsText),
            title: Text(getLabelFromType(ticket.type)),
            trailing: const Icon(Icons.sms),
          ),
        ));
  }
}
