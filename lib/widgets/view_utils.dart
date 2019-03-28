import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;//导入苹果风格的 菊花圈
import 'package:flutter/material.dart' ;

class ViewUtils {
  ///构建分割线
  Widget buildSepratorLine() {
    return Container(
      height: 4,
      color: Color.fromARGB(50, 183, 187, 197),
    );
  }

  ///加载更多
  Widget buildLoadMore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CupertinoActivityIndicator(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child:
          Text('加载更多中...',
              style: TextStyle(fontSize: 14.0, color: Colors.blue)),
        )
      ],
    );
  }

  ///没有更多
  Widget buildNoMore() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('---我是有底线的---',
            style: TextStyle(fontSize: 15.0, color: Colors.blueAccent))
      ],
    );
  }
}
