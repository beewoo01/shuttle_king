class LinePassengersDTO {
  int line_idx;
  int line_price;
  int account_idx;
  String account_name;
  String account_phone;
  int line_location_idx;
  String line_location_address;
  String line_location_destination_address;
  int line_passengers_is_active;
  int? line_stop_passengers_idx;
  int? line_operating_fee_idx;
  int? line_operating_fee_deposit_status;
  int? line_operating_fee_deposit_amount;

  LinePassengersDTO(
      {required this.line_idx,
      required this.line_price,
      required this.account_idx,
      required this.account_name,
      required this.account_phone,
      required this.line_location_idx,
      required this.line_location_address,
      required this.line_location_destination_address,
      required this.line_passengers_is_active,
      required this.line_stop_passengers_idx,
      required this.line_operating_fee_idx,
      required this.line_operating_fee_deposit_status,
      required this.line_operating_fee_deposit_amount
      });

  factory LinePassengersDTO.fromJson(Map<String, dynamic> json) {
    return LinePassengersDTO(
      line_idx: json["line_idx"],
      line_price: json["line_price"],
      account_idx: json["account_idx"],
      account_name: json["account_name"],
      account_phone: json["account_phone"],
      line_location_idx: json["line_location_idx"],
      line_location_address: json["line_location_address"],
      line_location_destination_address:
          json["line_location_destination_address"],
      line_passengers_is_active: json["line_passengers_is_active"],
      line_stop_passengers_idx: json["line_stop_passengers_idx"],
      line_operating_fee_idx: json["line_operating_fee_idx"],
      line_operating_fee_deposit_status: json["line_operating_fee_deposit_status"],
      line_operating_fee_deposit_amount: json["line_operating_fee_deposit_amount"],
    );
  }
}
