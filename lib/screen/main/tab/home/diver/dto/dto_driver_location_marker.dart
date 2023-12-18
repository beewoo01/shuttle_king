class DriverLocationMarkerDTO {
  int line_location_idx;
  double line_location_latitude;
  double line_location_longitude;
  String line_location_address;
  double line_location_destination_latitude;
  double line_location_destination_longitude;
  String line_location_destination_address;
  int line_location_boarding_number;

  DriverLocationMarkerDTO(
      {required this.line_location_idx,
      required this.line_location_latitude,
      required this.line_location_longitude,
      required this.line_location_address,
      required this.line_location_destination_latitude,
      required this.line_location_destination_longitude,
      required this.line_location_destination_address,
      required this.line_location_boarding_number});

  factory DriverLocationMarkerDTO.fromJson(Map<String, dynamic> json) {
    return DriverLocationMarkerDTO(
      line_location_idx: json["line_location_idx"],
      line_location_latitude: json["line_location_latitude"],
      line_location_longitude: json["line_location_longitude"],
      line_location_address: json["line_location_address"],
      line_location_destination_latitude:
          json["line_location_destination_latitude"],
      line_location_destination_longitude:
          json["line_location_destination_longitude"],
      line_location_destination_address:
          json["line_location_destination_address"],
      line_location_boarding_number: json["line_location_boarding_number"],
    );
  }
}
