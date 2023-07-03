import 'dart:ui';
import 'package:beograd_plus/src/model/city_zone.dart';

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
