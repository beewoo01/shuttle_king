import 'package:flutter/material.dart';
import 'package:shuttle_king/common/common.dart';

class DropDownButtonAmOrPmWidget extends StatefulWidget {
  const DropDownButtonAmOrPmWidget({super.key});

  @override
  State<DropDownButtonAmOrPmWidget> createState() =>
      _DropDownButtonAmOrPmWidgetState();
}

class _DropDownButtonAmOrPmWidgetState
    extends State<DropDownButtonAmOrPmWidget> {
  final _valueList = ["오전", "오후"];
  late String _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = _valueList[0];
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          //background color of dropdown button
          border: Border.all(color: AppColors.borderGrey, width: 0.5),
          //border of dropdown button
          borderRadius:
              BorderRadius.circular(50), //border raiuds of dropdown button
        ),
        child: DropdownButton(
          value: _selectedValue,
          items: _valueList
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: e.text.make(),
                  ))
              .toList(),
          onChanged: (value) {
            _selectedValue = value.toString();
          },
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.grey,
          ).pOnly(left: 5),
          iconEnabledColor: Colors.white,
          style: const TextStyle(
              color: Colors.black, //Font color
              fontSize: 13),
          //dropdown background color
          underline: Container(),
          //remove underline
          isExpanded: true, //make true to make width 100%
        ).pSymmetric(h: 10));

    /*DropdownButtonFormField(
        itemHeight: 50,
        isExpanded: true,
        decoration: InputDecoration(

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
        value: _selectedValue,
        items: _valueList
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: e.text.make(),
                ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedValue = value.toString();
          });
        });*/
  }
}
