import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';
import 'package:shuttle_king/screen/main/tab/search/detail/apply/vo/vo_line_location.dart';
import 'package:shuttle_king/screen/main/tab/search/vo/vo_bording_location.dart';

class BoardingLocationItemWidget extends StatefulWidget {
  const BoardingLocationItemWidget(
      {super.key,
      required this.boardingLocation,
      required this.isSelected,
      required this.index});

  final LineLocationVO boardingLocation;
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
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: 1,
                      color: widget.index == 0
                          ? Colors.white
                          : AppColors.brightGrey,
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
                      color: widget.index == -2
                          ? Colors.white
                          : AppColors.brightGrey,
                    ),
                  )
                ],
              ),
            ),
            width5,
            Expanded(
              flex: 9,
              child: Row(
                children: [
                  Expanded(
                    child: widget.boardingLocation.address
                        .substring(
                            widget.boardingLocation.address.indexOf(' ') + 1)
                        .text
                        .overflow(TextOverflow.ellipsis)
                        .maxLines(1)
                        .color(color)
                        .size(12)
                        .bold
                        .make(),
                  ),
                  width20,
                  Expanded(
                      flex: 1,
                      child: Row(
                        children: [
                          widget.boardingLocation.startTime.text
                              .color(color)
                              .make(),
                          width10,
                          "|".text.color(color).make(),
                          width10,

                          "${widget.boardingLocation.peopleCount}명 탑승".text.color(color).make()
                        ],
                      )),
                  /*width10,
                  "|".text.color(color).make(),
                  width10,

                  Expanded(
                    flex: 1,
                    child: "${widget.boardingLocation.boardingNumber}명 탑승"
                        .text
                        .color(color)
                        .make(),
                  )*/
                ],
              ),
            )
          ],
        ));
  }
}
