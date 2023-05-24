import 'ticket_type.dart';
import 'city_zone.dart';

class Ticket {
  TicketType type = TicketType.HOUR;
  CityZone zone = CityZone.A;
  String smsText = 'A90';
  int price = 50;

  Ticket(this.type, this.zone, this.smsText, this.price);

  Ticket.fromJson(Map<String, dynamic> json) {
    if (json['zone'] != null) {
      zone = CityZoneFromString[json['zone']]!;
    }
    if (json['type'] != null) {
      type = TicketTypeFromJson[json['type']]!;
    }
    if (json['smsText'] != null) {
      smsText = json['smsText'];
    }
    if (json['price'] != null) {
      price = json['price'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zone'] = CityZoneToString[zone];
    data['type'] = TicketTypeToJson[type];
    data['smsText'] = smsText;
    data['price'] = price;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Ticket && other.zone == zone && other.type == type;
  }
}
