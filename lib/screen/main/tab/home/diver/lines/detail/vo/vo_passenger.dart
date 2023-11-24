class Passenger {
  int passengersIdx;
  String accountName;
  String startAddress;
  String endAddress;
  int amount;
  bool isFinishDeposit;
  int isActive;

  Passenger(
      {required this.passengersIdx,
      required this.accountName,
      required this.startAddress,
      required this.endAddress,
      required this.amount,
      required this.isFinishDeposit,
      required this.isActive
      });
}
