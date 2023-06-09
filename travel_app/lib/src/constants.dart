// ignore: constant_identifier_names
import 'model/city_zone.dart';
import 'model/ticket.dart';
import 'model/ticket_type.dart';

const String API_BASE_URL = 'https://beogradplus.rs/';
const String SMS_NUMBER = "9011";

List<Ticket> ZONE_A_TICKETS = [
  Ticket(TicketType.HOUR, CityZone.A, "A90", 50),
  Ticket(TicketType.DAY, CityZone.A, "A1", 120),
  Ticket(TicketType.WEEK, CityZone.A, "A7", 800),
  Ticket(TicketType.MONTH, CityZone.A, "A30", 2200),
];

List<Ticket> ZONE_B_TICKETS = [
  Ticket(TicketType.HOUR, CityZone.B, "B90", 50),
  Ticket(TicketType.DAY, CityZone.B, "B1", 120),
  Ticket(TicketType.WEEK, CityZone.B, "B7", 800),
  Ticket(TicketType.MONTH, CityZone.B, "B30", 2200),
];

List<Ticket> ZONE_C_TICKETS = [
  Ticket(TicketType.HOUR, CityZone.C, "C90", 100),
  Ticket(TicketType.DAY, CityZone.C, "C1", 150),
  Ticket(TicketType.WEEK, CityZone.C, "C7", 1000),
  Ticket(TicketType.MONTH, CityZone.C, "C30", 3300),
];

Map<CityZone, List<Ticket>> PRICE_LIST = {
  CityZone.A: ZONE_A_TICKETS,
  CityZone.B: ZONE_B_TICKETS,
  CityZone.C: ZONE_C_TICKETS,
};

List<String> ZONE_A_MUNICIPALITIES = [
  "Novi Beograd",
  "Zemun",
  "Stari grad",
  "Savski venac",
  "Voždovac",
  "Čukarica",
  "Vračar",
  "Rakovica",
  "Palilula",
  "Zvezdara",
  "Surčin",
  "Grocka (severno od puta 347 Vrčin - Zaklopača)"
];

List<String> ZONE_B_MUNICIPALITIES = [
  "Lazarevac",
  "Mladenovac",
  "Obrenovac",
  "Barajevo",
  "Sopot",
  "Grocka (južno od puta 347 Vrčin - Zaklopača)"
];

List<String> ZONE_C_MUNICIPALITIES = [
  "Teritorija koja pokriva svih 17 beogradskih opština"
];
