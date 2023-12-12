class MarkerLocationDTO {
  int line_location_idx;
  double line_location_latitude;
  double line_location_longitude;
  double line_location_destination_latitude;
  double line_location_destination_longitude;
  int line_location_boarding_number;

  MarkerLocationDTO(
      {required this.line_location_idx,
      required this.line_location_latitude,
      required this.line_location_longitude,
      required this.line_location_destination_latitude,
      required this.line_location_destination_longitude,
      required this.line_location_boarding_number});

  factory MarkerLocationDTO.fromJson(Map<String, dynamic> json) {
    return MarkerLocationDTO(
      line_location_idx: json['line_location_idx'],
      line_location_latitude: json['line_location_latitude'],
      line_location_longitude: json['line_location_longitude'],
      line_location_destination_latitude: json['line_location_destination_latitude'],
      line_location_destination_longitude: json['line_location_destination_longitude'],
      line_location_boarding_number: json['line_location_boarding_number'],
    );
  }
}
