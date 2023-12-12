class PassengerCurrentLineDTO {
  final int line_passengers_line_idx;
  final String line_location_start_time;
  final String line_location_end_time;
  final double line_location_latitude;
  final double line_location_longitude;
  final String line_location_address;
  final double line_location_destination_latitude;
  final double line_location_destination_longitude;
  final String line_location_destination_address;
  final int numOfParticipants;
  final int driver_line_idx;

  PassengerCurrentLineDTO(
      {required this.line_passengers_line_idx,
      required this.line_location_start_time,
      required this.line_location_end_time,
      required this.line_location_latitude,
      required this.line_location_longitude,
      required this.line_location_address,
      required this.line_location_destination_latitude,
      required this.line_location_destination_longitude,
      required this.line_location_destination_address,
      required this.numOfParticipants,
      required this.driver_line_idx});

  factory PassengerCurrentLineDTO.fromJson(Map<String, dynamic> json) {
    return PassengerCurrentLineDTO(
        line_passengers_line_idx: json['line_passengers_line_idx'] ,
        line_location_start_time: json['line_location_start_time'] ,
        line_location_end_time: json['line_location_end_time'] ,
        line_location_latitude: json['line_location_latitude'] ,
        line_location_longitude: json['line_location_longitude'] ,
        line_location_address: json['line_location_address'] ,
        line_location_destination_latitude: json['line_location_destination_latitude'] ,
        line_location_destination_longitude: json['line_location_destination_longitude'] ,
        line_location_destination_address: json['line_location_destination_address'] ,
        numOfParticipants: json['numOfParticipants'] ,
        driver_line_idx: json['driver_line_idx'] );
  }
}
