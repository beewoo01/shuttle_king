class SearchDTO {
  int line_idx;
  String start_address;
  String destination_address;
  String start_time;
  int line_capacity;
  int currentPeople;
  int driverState;

  SearchDTO({
    required this.line_idx,
    required this.start_address,
    required this.destination_address,
    required this.start_time,
    required this.line_capacity,
    required this.currentPeople,
    required this.driverState});

  factory SearchDTO.fromJson(Map<String, dynamic> json) {
    return SearchDTO(
        line_idx: json['line_idx'],
        start_address: json['start_address'],
        destination_address: json['destination_address'],
        start_time: json['start_time'],
        line_capacity: json['line_capacity'],
        currentPeople: json['currentPeople'],
        driverState: json['driverState']
    );
  }
}