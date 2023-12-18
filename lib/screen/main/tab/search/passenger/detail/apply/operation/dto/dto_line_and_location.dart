class LineAndLocationDTO {
  String? line_location_start_time;
  String? line_location_end_time;
  int line_capacity;
  String line_car_type;
  String line_price;
  String day_of_week;

  LineAndLocationDTO({required this.line_location_start_time,
    required this.line_location_end_time,
    required this.line_capacity,
    required this.line_car_type,
    required this.line_price,
    required this.day_of_week});

  factory LineAndLocationDTO.fromJson(Map<String, dynamic> json) {
    return LineAndLocationDTO(
        line_location_start_time: json['line_location_start_time'],
        line_location_end_time: json['line_location_end_time'],
        line_capacity: json['line_capacity'],
        line_car_type: json['line_car_type'],
        line_price: json['line_price'],
        day_of_week: json['day_of_week']);
  }


}