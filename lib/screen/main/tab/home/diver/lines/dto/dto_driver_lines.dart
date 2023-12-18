class DriverLinesDTO {
  int line_idx;
  int line_capacity;
  String line_location_address;
  String line_location_destination_address;
  String line_location_start_time;
  String line_location_end_time;
  int line_price;
  int numOfcurrent;

  DriverLinesDTO(
      {required this.line_idx,
      required this.line_capacity,
      required this.line_location_address,
      required this.line_location_destination_address,
      required this.line_location_start_time,
      required this.line_location_end_time,
      required this.line_price,
      required this.numOfcurrent});

  factory DriverLinesDTO.fromJson(Map<String, dynamic> map) {
    return DriverLinesDTO(
        line_idx: map['line_idx'],
        line_capacity: map['line_capacity'],
        line_location_address: map['line_location_address'],
        line_location_destination_address:
            map['line_location_destination_address'],
        line_location_start_time: map['line_location_start_time'],
        line_location_end_time: map['line_location_end_time'],
        line_price: map['line_price'],
        numOfcurrent: map['numOfcurrent']);
  }
}
