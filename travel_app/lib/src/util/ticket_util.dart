import 'dart:ui';

import 'package:beograd_plus/src/model/city_zone.dart';

import '../model/ticket_type.dart';

String getLabelFromType(TicketType? type) {
  if (type == null) {
    return 'Vremenska karta (90 min)';
  }
  switch (type) {
    case TicketType.DAY:
      return 'Dnevna karta (1 dan)';
    case TicketType.WEEK:
      return 'Nedeljna karta (7 dana)';
    case TicketType.MONTH:
      return 'Mesečna karta';
    default:
      return 'Vremenska karta (90 min)';
  }
}

String getDescriptionFromType(TicketType? type) {
  if (type == null) {
    return 'Vremenska karta (90 min)';
  }
  switch (type) {
    case TicketType.DAY:
      return 'Do 23:59 tekućeg dana';
    case TicketType.WEEK:
      return 'Važi narednih 7 dana';
    case TicketType.MONTH:
      return 'Važi do kraja tekućeg meseca';
    default:
      return '90 minuta od kupovine';
  }
}

Color getColorFromZone(CityZone? zone) {
  if (zone == null) {
    return const Color(0xFFC3010D);
  }
  switch (zone) {
    case CityZone.A:
      return const Color(0xFFffa1a1);
    case CityZone.B:
      return const Color(0xFFb8baff);
    default:
      return const Color(0xFFffd6fc);
  }
}
