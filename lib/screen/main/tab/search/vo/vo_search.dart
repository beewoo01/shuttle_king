class SearchVO {
  int lineIdx;
  String startAddress;
  String destinationAddress;
  String startTime;
  int lineCapacity;
  int currentPeople;
  int driverState;

  SearchVO(
      {required this.lineIdx,
      required this.startAddress,
      required this.destinationAddress,
      required this.startTime,
      required this.lineCapacity,
      required this.currentPeople,
      required this.driverState});


}
