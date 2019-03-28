import 'package:json_annotation/json_annotation.dart';

part 'news_bean.g.dart';

///使用过程中会出现这种错误  例如: *Could not generate `fromJson` code for `newsList` because the type is undefined.*
///就是说解析时候，某个类未声明，是因为解析时候 是从上往下解析的
///当你上个类中引用了下面那个类，那个类还没声明，所以调换位置即可
///
@JsonSerializable()
class NewsBean {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  Msg msg;

  NewsBean(
    this.code,
    this.msg,
  );

  factory NewsBean.fromJson(Map<String, dynamic> srcJson) =>
      _$NewsBeanFromJson(srcJson);
}

@JsonSerializable()
class Msg {
  @JsonKey(name: 'news')
  News news;

  @JsonKey(name: 'slide')
  List<Slide> slide;

  Msg(
    this.news,
    this.slide,
  );

  factory Msg.fromJson(Map<String, dynamic> srcJson) => _$MsgFromJson(srcJson);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'authorImg')
  String authorImg;

  @JsonKey(name: 'commCount')
  int commCount;

  @JsonKey(name: 'detailUrl')
  String detailUrl;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'newsType')
  String newsType;

  @JsonKey(name: 'summary')
  String summary;

  @JsonKey(name: 'thumb')
  String thumb;

  @JsonKey(name: 'timeStr')
  String timeStr;

  @JsonKey(name: 'title')
  String title;

  Data(
    this.author,
    this.authorImg,
    this.commCount,
    this.detailUrl,
    this.id,
    this.newsType,
    this.summary,
    this.thumb,
    this.timeStr,
    this.title,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);
}

@JsonSerializable()
class News {
  @JsonKey(name: 'data')
  List<Data> data;

  @JsonKey(name: 'total')
  int total;

  News(
    this.data,
    this.total,
  );

  factory News.fromJson(Map<String, dynamic> srcJson) =>
      _$NewsFromJson(srcJson);
}

@JsonSerializable()
class Slide {
  @JsonKey(name: 'detailUrl')
  String detailUrl;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'imgUrl')
  String imgUrl;

  @JsonKey(name: 'summary')
  String summary;

  @JsonKey(name: 'timeStr')
  String timeStr;

  @JsonKey(name: 'title')
  String title;

  Slide(
    this.detailUrl,
    this.id,
    this.imgUrl,
    this.summary,
    this.timeStr,
    this.title,
  );

  factory Slide.fromJson(Map<String, dynamic> srcJson) =>
      _$SlideFromJson(srcJson);
}
