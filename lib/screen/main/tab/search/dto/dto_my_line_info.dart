class MyLineInfoDTO {
  String lineList;
  int currentPassenger;
  String operationDays;

  MyLineInfoDTO({required this.lineList,
    required this.currentPassenger,
    required this.operationDays});

  factory MyLineInfoDTO.fromJson(Map<String, dynamic> json) {
    return MyLineInfoDTO(
        lineList: json['lineList'],
        currentPassenger: json['currentPassenger'],
        operationDays: json['operationDays']
    );
  }
}
