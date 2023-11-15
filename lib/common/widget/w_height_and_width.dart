import 'package:flutter/material.dart';

const height5 = Height(5);
const height10 = Height(10);
const height20 = Height(20);
const height30 = Height(30);

const width5 = Height(5);
const width10 = Height(10);
const width20 = Height(20);
const width30 = Height(30);

class Height extends StatelessWidget {
  final double height;

  const Height(
    this.height, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class Width extends StatelessWidget {
  final double width;

  const Width(
    this.width, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
