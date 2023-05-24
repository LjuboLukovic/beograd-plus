enum CityZone { A, B, C }

const Map<String, CityZone> CityZoneFromString = {
  'A': CityZone.A,
  'B': CityZone.B,
  'C': CityZone.C
};

const Map<CityZone, String> CityZoneToString = {
  CityZone.A: 'A',
  CityZone.B: 'B',
  CityZone.C: 'C',
};
