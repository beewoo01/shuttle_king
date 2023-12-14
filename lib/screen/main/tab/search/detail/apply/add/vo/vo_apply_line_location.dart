class ApplyLineLocationVO {
  int line_location_line_idx;
  double line_location_latitude;
  double line_location_longitude;
  String line_location_address;
  double line_location_destination_latitude;
  double line_location_destination_longitude;
  String line_location_destination_address;
  String line_location_start_time;
  String line_location_end_time;
  int line_location_boarding_number;

  ApplyLineLocationVO(
      {required this.line_location_line_idx,
      required this.line_location_latitude,
      required this.line_location_longitude,
      required this.line_location_address,
      required this.line_location_destination_latitude,
      required this.line_location_destination_longitude,
      required this.line_location_destination_address,
      required this.line_location_start_time,
      required this.line_location_end_time,
      required this.line_location_boarding_number});



}
