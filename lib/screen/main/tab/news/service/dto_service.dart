class ServiceDTO {
  final int questionIdx;
  final String questionDescription;
  final String questionCreatetime;
  final String? questionAnswerDescription;
  final String? questionAnswerUpdatetime;

  ServiceDTO(
      {required this.questionIdx,
      required this.questionDescription,
      required this.questionCreatetime,
      required this.questionAnswerDescription,
      required this.questionAnswerUpdatetime});

  factory ServiceDTO.fromJson(Map<String, dynamic> json) {
    return ServiceDTO(
        questionIdx: json['question_idx'],
        questionDescription: json['question_description'],
        questionCreatetime: json['question_createtime'],
        questionAnswerDescription: json['question_answer_description'],
        questionAnswerUpdatetime: json['question_answer_updatetime']);
  }
}
