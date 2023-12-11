class NewsVO {
  int idx;
  String title;
  String content;

  NewsVO(this.idx, this.title, this.content);

  NewsVO.fromJson(Map<String, dynamic> map)
      : idx = map['idx'],
        title = map['title'],
        content = map['content'];
}
