class DriverLineDTO{
  int driverIdx;
  int lineIdx;
  String currentLine;

  DriverLineDTO(
      {required this.driverIdx,
        required this.lineIdx,
        required this.currentLine});

  factory DriverLineDTO.fromJson(Map<String, dynamic> json) {
    return DriverLineDTO(
      driverIdx: json["driver_idx"],
      lineIdx: json["line_idx"],
      currentLine: json["current_line"],
    );
  }
}