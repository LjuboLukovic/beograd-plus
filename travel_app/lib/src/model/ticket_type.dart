enum TicketType { HOUR, DAY, WEEK, MONTH }

const Map<String, TicketType> TicketTypeFromJson = {
  'HOUR': TicketType.HOUR,
  'DAY': TicketType.DAY,
  'WEEK': TicketType.WEEK,
  'MONTH': TicketType.MONTH
};

const Map<TicketType, String> TicketTypeToJson = {
  TicketType.HOUR: 'HOUR',
  TicketType.DAY: 'DAY',
  TicketType.WEEK: 'WEEK',
  TicketType.MONTH: 'MONTH'
};
