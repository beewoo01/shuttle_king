import 'package:shuttle_king/screen/main/tab/news/vo_news.dart';

class ServiceVO {
  /*ServiceVO(super.idx, super.title, super.content,
      {required this.serviceCreateTime});*/
  final int questionIdx;
  final String questionDescription;
  final String questionCreateTime;
  final String? questionAnswerDescription;
  final String? questionAnswerUpdateTime;

  ServiceVO(
    this.questionAnswerDescription,
    this.questionAnswerUpdateTime, {
    required this.questionIdx,
    required this.questionDescription,
    required this.questionCreateTime,
  });

  factory ServiceVO.fromJson(Map<String, dynamic> json) {
    return ServiceVO(
      questionIdx: json['question_idx'],
      questionDescription: json['question_description'],
      questionCreateTime: json['question_createtime'],
      json['question_answer_description'],
      json['question_answer_updatetime'],
    );
  }
}
