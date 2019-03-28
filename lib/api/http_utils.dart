import 'package:dio/dio.dart';
import 'package:flutter_trans/api/api.dart';

class HttpUtils {

  ///获取项目内容
  Future<Response> getProjectContent(int page, int id) async {
    var dio = Dio();
    var url = Api.PROJECT_LIST + 'project/list/$page/json?cid=$id';
    print('请求url------------------>$url');
    try {
      Response response = await dio.get(url);
      return response;
    } catch (e) {
      return null;
    }
  }

  ///获取项目分类
  Future<Response> getProgectCatgory() async {
    var dio = Dio();
    var url = Api.PROJECT_LIST + 'project/tree/json';

    try {
      Response response = await dio.get(url);
      return response;
    } catch (e) {
      return null;
    }
  }
}
