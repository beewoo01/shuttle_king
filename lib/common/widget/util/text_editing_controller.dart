import 'package:flutter/cupertino.dart';

class TaggedTextFieldController extends TextEditingController {
  final String tag;

  TaggedTextFieldController(this.tag);

  String getTag() => tag;

}
