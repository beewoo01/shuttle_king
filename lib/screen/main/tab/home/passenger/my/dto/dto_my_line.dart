class MyLineDTO {
  int lineIdx;
  String address;
  String destinationAddress;
  String startTime;
  int capacity;
  String? phone;
  int num;

  MyLineDTO({required this.lineIdx,
    required this.address,
    required this.destinationAddress,
    required this.startTime,
    required this.capacity,
    required this.phone,
    required this.num});

  factory MyLineDTO.fromJson(Map<String, dynamic> json) {
    return MyLineDTO(
        lineIdx: json['line_idx'],
        address: json['line_location_address'],
        destinationAddress: json['line_location_destination_address'],
        startTime: json['line_location_start_time'],
        capacity: json['line_capacity'],
        phone: json['account_phone'],
        num: json['num']);
  }
}
