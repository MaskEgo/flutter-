// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsBean _$NewsBeanFromJson(Map<String, dynamic> json) {
  return NewsBean(
      json['code'] as int,
      json['msg'] == null
          ? null
          : Msg.fromJson(json['msg'] as Map<String, dynamic>));
}

Map<String, dynamic> _$NewsBeanToJson(NewsBean instance) =>
    <String, dynamic>{'code': instance.code, 'msg': instance.msg};

Msg _$MsgFromJson(Map<String, dynamic> json) {
  return Msg(
      json['news'] == null
          ? null
          : News.fromJson(json['news'] as Map<String, dynamic>),
      (json['slide'] as List)
          ?.map((e) =>
              e == null ? null : Slide.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MsgToJson(Msg instance) =>
    <String, dynamic>{'news': instance.news, 'slide': instance.slide};

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      json['author'] as String,
      json['authorImg'] as String,
      json['commCount'] as int,
      json['detailUrl'] as String,
      json['id'] as String,
      json['newsType'] as String,
      json['summary'] as String,
      json['thumb'] as String,
      json['timeStr'] as String,
      json['title'] as String);
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'author': instance.author,
      'authorImg': instance.authorImg,
      'commCount': instance.commCount,
      'detailUrl': instance.detailUrl,
      'id': instance.id,
      'newsType': instance.newsType,
      'summary': instance.summary,
      'thumb': instance.thumb,
      'timeStr': instance.timeStr,
      'title': instance.title
    };

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int);
}

Map<String, dynamic> _$NewsToJson(News instance) =>
    <String, dynamic>{'data': instance.data, 'total': instance.total};

Slide _$SlideFromJson(Map<String, dynamic> json) {
  return Slide(
      json['detailUrl'] as String,
      json['id'] as String,
      json['imgUrl'] as String,
      json['summary'] as String,
      json['timeStr'] as String,
      json['title'] as String);
}

Map<String, dynamic> _$SlideToJson(Slide instance) => <String, dynamic>{
      'detailUrl': instance.detailUrl,
      'id': instance.id,
      'imgUrl': instance.imgUrl,
      'summary': instance.summary,
      'timeStr': instance.timeStr,
      'title': instance.title
    };
