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
