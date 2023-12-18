class LineDetailInfoDTO {
  int line_idx;
  int line_capacity;
  String line_car_type;
  String line_location_address;
  String line_destination_address;
  String line_location_start_time;
  int currentPassengerCount;
  String? operationDays;

  LineDetailInfoDTO(
      {required this.line_idx,
      required this.line_capacity,
      required this.line_car_type,
      required this.line_location_address,
      required this.line_destination_address,
      required this.line_location_start_time,
      required this.currentPassengerCount,
      required this.operationDays});

  factory LineDetailInfoDTO.fromJson(Map<String, dynamic> map) {
    return LineDetailInfoDTO(
        line_idx: map['line_idx'],
        line_capacity: map['line_capacity'],
        line_car_type: map['line_car_type'],
        line_location_address: map['line_location_address'],
        line_destination_address: map['line_destination_address'],
        line_location_start_time: map['line_location_start_time'],
        currentPassengerCount: map['currentPassengerCount'],
        operationDays: map['operationDays']);
  }
}
