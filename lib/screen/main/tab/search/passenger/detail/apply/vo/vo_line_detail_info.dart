class LineDetailInfoVO {
  int lineIdx;
  int lineCapacity;
  String lineCarType;
  String lineLocationAddress;
  String lineDestinationAddress;
  String lineLocationStartTime;
  int currentPassengerCount;
  String operationDays;

  LineDetailInfoVO(
      {required this.lineIdx,
      required this.lineCapacity,
      required this.lineCarType,
      required this.lineLocationAddress,
      required this.lineDestinationAddress,
      required this.lineLocationStartTime,
      required this.currentPassengerCount,
      required this.operationDays});
}
