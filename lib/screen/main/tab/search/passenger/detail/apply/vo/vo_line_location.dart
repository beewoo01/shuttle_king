class LineLocationVO {
  final int locationIdx;
  final int lineIdx;
  final double latitude;
  final double longitude;
  final String address;
  final double destinationLatitude;
  final double destinationLongitude;
  final String startTime;
  final int boardingNumber;
  final int peopleCount;

  LineLocationVO(
      this.locationIdx,
      this.lineIdx,
      this.latitude,
      this.longitude,
      this.address,
      this.destinationLatitude,
      this.destinationLongitude,
      this.startTime,
      this.boardingNumber,
      this.peopleCount);
}
