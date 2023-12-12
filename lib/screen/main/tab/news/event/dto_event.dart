class EventDTO {
  int eventIdx;
  String eventTitle;
  String eventS;
  String eventE;
  String? eventDescription;
  String eventCreatetime;
  int eventDel;
  int eventImgIdx;
  String eventImgUrl;

  EventDTO({required this.eventIdx,
    required this.eventTitle,
    required this.eventS,
    required this.eventE,
    required this.eventDescription,
    required this.eventCreatetime,
    required this.eventDel,
    required this.eventImgIdx,
    required this.eventImgUrl});

  factory EventDTO.fromJson(Map<String, dynamic> json) {
    return EventDTO(
        eventIdx: json['event_idx'],
        eventTitle: json['event_title'],
        eventS: json['event_s'],
        eventE: json['event_e'],
        eventDescription: json['event_description'],
        eventCreatetime: json['event_createtime'],
        eventDel: json['event_del'],
        eventImgIdx: json['event_img_idx'] ?? 0,
        eventImgUrl: json['event_img_url'] ?? ""
    );
  }

}