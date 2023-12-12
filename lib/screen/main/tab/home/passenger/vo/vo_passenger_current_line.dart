class PassengerCurrentLineVO {
  final int lineIdx;
  final String startTime;
  final String endTime;
  final double latitude;
  final double longitude;
  final String address;
  final double destinationLatitude;
  final double destinationLongitude;
  final String destinationAddress;
  final int numOfParticipants;
  final int? driverLineIdx;

  PassengerCurrentLineVO(
      {required this.lineIdx,
      required this.startTime,
      required this.endTime,
      required this.latitude,
      required this.longitude,
      required this.address,
      required this.destinationLatitude,
      required this.destinationLongitude,
      required this.destinationAddress,
      required this.numOfParticipants,
      this.driverLineIdx});
}
