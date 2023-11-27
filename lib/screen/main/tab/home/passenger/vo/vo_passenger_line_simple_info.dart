class PassengerLineSimpleInfoVO {
  String startTime;
  String endTime;
  String startAddress;
  String endAddress;
  int numberOfPeopleOnBard;
  int driverIdx;
  double startLatitude;
  double startLongitude;
  double endLatitude;
  double endLongitude;

  PassengerLineSimpleInfoVO({
      required this.startTime,
      required this.endTime,
      required this.startAddress,
      required this.endAddress,
      required this.numberOfPeopleOnBard,
      required this.driverIdx,
      required this.startLatitude,
      required this.startLongitude,
      required this.endLatitude,
      required this.endLongitude});
}