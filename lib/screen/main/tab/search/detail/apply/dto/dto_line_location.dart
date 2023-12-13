class LineLocationDTO {
  final int line_location_idx;
  final int line_location_line_idx;
  final double line_location_latitude;
  final double line_location_longitude;
  final String line_location_address;
  final double line_location_destination_latitude;
  final double line_location_destination_longitude;
  final String line_location_start_time;
  final int line_location_boarding_number;
  final int peopleCount;

  LineLocationDTO(
      {required this.line_location_idx,
      required this.line_location_line_idx,
      required this.line_location_latitude,
      required this.line_location_longitude,
      required this.line_location_address,
      required this.line_location_destination_latitude,
      required this.line_location_destination_longitude,
      required this.line_location_start_time,
      required this.line_location_boarding_number,
      required this.peopleCount});

  factory LineLocationDTO.fromJson(Map<String, dynamic> json) {
    return LineLocationDTO(
        line_location_idx: json['line_location_idx'],
        line_location_line_idx: json['line_location_line_idx'],
        line_location_latitude: json['line_location_latitude'],
        line_location_longitude: json['line_location_longitude'],
        line_location_address: json['line_location_address'],
        line_location_destination_latitude:
            json['line_location_destination_latitude'],
        line_location_destination_longitude:
            json['line_location_destination_longitude'],
        line_location_start_time: json['line_location_start_time'],
        line_location_boarding_number: json['line_location_boarding_number'],
        peopleCount: json['peopleCount']);
  }
}
