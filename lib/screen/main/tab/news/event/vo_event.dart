class EventVO {
  int idx;
  String eventTitle;
  String startDate;
  String endDate;
  int eventStatus;

  EventVO(
      {required this.idx,
      required this.eventTitle,
      required this.startDate,
      required this.endDate,
      required this.eventStatus});
}
