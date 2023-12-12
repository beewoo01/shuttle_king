class MarkerLocationVO {
  int locationIdx;
  double locationLatitude;
  double locationLongitude;
  double destinationLatitude;
  double destinationLongitude;
  int boardingNumber;

  MarkerLocationVO(
      {required this.locationIdx,
      required this.locationLatitude,
      required this.locationLongitude,
      required this.destinationLatitude,
      required this.destinationLongitude,
      required this.boardingNumber});

  @override
  String toString() {
    return "MarkerLocationVO locationIdx: $locationIdx, locationLatitude: $locationLatitude, locationLongitude : $locationLongitude, destinationLatitude: $destinationLatitude, destinationLongitude : $destinationLongitude, boardingNumber : $boardingNumber";
  }
}
