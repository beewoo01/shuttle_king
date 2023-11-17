class SearchLine {
  final int line_idx;
  final int line_capacity;
  final int current_passangers_count;
  final String line_destination_address;
  final String line_start_address;
  final String start_time;
  final bool isMatching;

  SearchLine(this.line_idx, this.line_capacity, this.current_passangers_count,
      this.line_destination_address, this.line_start_address, this.start_time, this.isMatching);
}