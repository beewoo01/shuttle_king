class LineRegistDTO {
  int line_idx;
  int accountIdx;
  int line_capacity;
  String line_car_type;
  String line_price;
  String line_location_address;
  double line_location_latitude;
  double line_location_longitude;
  String line_destination_address;
  double line_destination_latitude;
  double line_destination_longitude;
  String line_location_start_time;
  String line_location_end_time;
  int line_location_boarding_number;
  String day_of_week_idx;

  LineRegistDTO(
      this.line_idx,
      this.accountIdx,
      this.line_capacity,
      this.line_car_type,
      this.line_price,
      this.line_location_address,
      this.line_location_latitude,
      this.line_location_longitude,
      this.line_destination_address,
      this.line_destination_latitude,
      this.line_destination_longitude,
      this.line_location_start_time,
      this.line_location_end_time,
      this.line_location_boarding_number,
      this.day_of_week_idx);

  /*Map<String, dynamic> toJson() {
    return {
      'isKeyboardOpen': isKeyboardOpen,
      'keyboardHeight': keyboardHeight,
    };*/

  Map<String, dynamic> toJson() {
    return {
      'line_idx': line_idx,
      'accountIdx': accountIdx,
      'line_capacity': line_capacity,
      'line_car_type': line_car_type,
      'line_price': line_price,
      'line_location_address': line_location_address,
      'line_location_latitude': line_location_latitude,
      'line_location_longitude': line_location_longitude,
      'line_destination_address': line_destination_address,
      'line_destination_latitude': line_destination_latitude,
      'line_destination_longitude': line_destination_longitude,
      'line_location_start_time': line_location_start_time,
      'line_location_end_time': line_location_end_time,
      'line_location_boarding_number': line_location_boarding_number,
      'day_of_week_idx': day_of_week_idx,
    };
  }
}
