class MyLine {
  int line_idx;
  String line_start_address;
  String line_destination_address;
  String start_time;
  int line_capacity;
  int current_passangers_count;

  MyLine(
      {required this.line_idx,
      required this.line_start_address,
      required this.line_destination_address,
      required this.start_time,
      required this.line_capacity,
      required this.current_passangers_count});
}
