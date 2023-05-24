enum TicketType { HOUR, DAY, WEEK, MONTH, YEAR }

const Map<String, TicketType> TicketTypeFromJson = {
  'HOUR': TicketType.HOUR,
  'DAY': TicketType.DAY,
  'WEEK': TicketType.WEEK,
  'MONTH': TicketType.MONTH,
  'YEAR': TicketType.YEAR
};

const Map<TicketType, String> TicketTypeToJson = {
  TicketType.HOUR: 'HOUR',
  TicketType.DAY: 'DAY',
  TicketType.WEEK: 'WEEK',
  TicketType.MONTH: 'MONTH',
  TicketType.YEAR: 'YEAR'
};
