enum CityZone { A, B, C }

const Map<String, CityZone> CityZoneFromJson = {
  'A': CityZone.A,
  'B': CityZone.B,
  'C': CityZone.C
};

const Map<CityZone, String> CityZoneToJson = {
  CityZone.A: 'A',
  CityZone.B: 'B',
  CityZone.C: 'C',
};
