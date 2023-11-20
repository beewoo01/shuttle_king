class LineDetail {
  int line_idx;
  int line_account_idx;
  int line_capacity;
  String line_car_type;
  String line_price;
  String line_destination_address;
  String line_destination_latitude;
  String line_destination_longitude;
  String line_createtime;

  LineDetail(
      {required this.line_idx,
      required this.line_account_idx,
      required this.line_capacity,
      required this.line_car_type,
      required this.line_price,
      required this.line_destination_address,
      required this.line_destination_latitude,
      required this.line_destination_longitude,
      required this.line_createtime});
}
