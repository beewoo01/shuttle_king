class LineInfoDTO {
  String lineList;
  int currentPassenger;
  String? operationDays;

  LineInfoDTO(
      {required this.lineList, required this.currentPassenger, required this.operationDays});

  factory LineInfoDTO.fromJson(Map<String, dynamic> json) {
    return LineInfoDTO(
        lineList: json['lineList'],
        currentPassenger: json['currentPassenger'],
        operationDays: json['operationDays']
    );
  }
}