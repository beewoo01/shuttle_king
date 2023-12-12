class MyLineVO {
  int lineIdx;
  String? driverPhoneNum;
  String startAddress;
  String endAddress;
  String startTime;
  int capacity;
  int passengersCount;

  MyLineVO(
      {required this.lineIdx,
      required this.driverPhoneNum,
      required this.startAddress,
      required this.endAddress,
      required this.startTime,
      required this.capacity,
      required this.passengersCount});
}
