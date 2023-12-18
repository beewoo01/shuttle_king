class BoardingLocation {
  int line_location_idx;
  int line_location_line_idx;
  double line_location_latitude;
  double line_location_longitude;
  String line_location_address;
  String line_location_start_time;
  String line_location_end_time;
  int line_location_boarding_number;
  int boarding_count;
  int line_price;

  BoardingLocation(
      {required this.line_location_idx,
      required this.line_location_line_idx,
      required this.line_location_latitude,
      required this.line_location_longitude,
      required this.line_location_address,
      required this.line_location_start_time,
      required this.line_location_end_time,
      required this.line_location_boarding_number,
      required this.boarding_count,
      required this.line_price});
}
