import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/serch/vo/vo_bording_location.dart';

class BoardingLocationItemWidget extends StatefulWidget {
  const BoardingLocationItemWidget(
      {super.key,
      required this.boardingLocation,
      required this.isSelected,
      required this.index});

  final BoardingLocation boardingLocation;
  final bool isSelected;
  final int index;

  @override
  State<BoardingLocationItemWidget> createState() =>
      _BoardingLocationItemWidgetState();
}

class _BoardingLocationItemWidgetState
    extends State<BoardingLocationItemWidget> {
  @override
  Widget build(BuildContext context) {
    Color color = widget.isSelected ? AppColors.mainGreenColor : AppColors.grey;
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 1,
                  color:
                      widget.index == 0 ? Colors.white : AppColors.brightGrey,
                ),
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.5),
                    border: Border.all(
                        color: AppColors.mainGreenColor,
                        width: widget.isSelected ? 5 : 1)),
              ),
              Expanded(
                child: Container(
                  width: 1,
                  color:
                      widget.index == -2 ? Colors.white : AppColors.brightGrey,
                ),
              )
            ],
          ),
          width20,
          widget.boardingLocation.line_location_address
              .substring(
                  widget.boardingLocation.line_location_address.indexOf(' ') +
                      1)
              .text
              .color(color)
              .bold
              .make(),
          width30,
          widget.boardingLocation.line_location_start_time.text
              .color(color)
              .make(),
          width10,
          "|".text.color(color).make(),
          width10,
          "${widget.boardingLocation.boarding_count}명 탑승"
              .text
              .color(color)
              .make()
        ],
      ),
    );
  }
}
