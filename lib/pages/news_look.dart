import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trans/api/api.dart';
import 'package:flutter_trans/model/news_bean.dart';
import 'package:flutter_trans/pages/news_detail_pages.dart';
import 'package:flutter_trans/widgets/view_utils.dart';

///资讯
class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<Data> _dataList = [];
  List<Slide> _slidelist = [];

  int curPage = 1;
  int totalPage = 0;

  final TextStyle subtitleStyle =
      TextStyle(color: const Color(0xFFB5BDC0), fontSize: 12.0);
  final ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      var m = _scrollController.position.pixels;
      var t = _scrollController.position.maxScrollExtent;
      if (m == t && curPage * 10 < totalPage) {
        curPage++;
        getData(true);
      }
    });

    getData(false);
  }

  @override
  Widget build(BuildContext context) {
    var listView = ListView.separated(
//      physics: BouncingScrollPhysics(),
        itemCount: _dataList.length + 1,
        controller: _scrollController,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _creatBannerView();
          } else if (index < _dataList.length) {
            return creatSubView(context, index);
          } else {
            return ViewUtils().buildLoadMore();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
              height: 2, color: const Color.fromARGB(50, 183, 187, 197));
        });

    return Scaffold(
        appBar: AppBar(
          title: Text("资讯"),
          backgroundColor: Colors.green, //设置appbar背景颜色
          centerTitle: true, //设置标题是否局中
        ),
        body: _dataList.length == 0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(child: listView, onRefresh: refresh));
  }

  ///创建广告栏
  Widget _creatBannerView() {
    return Container(
      height: 180.0,
      padding: EdgeInsets.all(5.0),
      child: Swiper(
        autoplay: true,
        pagination: SwiperPagination(),
        itemCount: _slidelist.length,
        onTap: (index) {
          // 点击跳转到详情
          Navigator.of(context).push( MaterialPageRoute(
              builder: (ctx) => NewsDetailPage(id: _slidelist[index].detailUrl)));
        },
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _slidelist[index].imgUrl,
            fit: BoxFit.fill,
            height: 180.0,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  ///获取数据
  void getData(bool isLoadMore) async {
    var url = Api.NEWS_LIST;
    url += '?pageIndex=$curPage&pageSize=10';
    Response response = await Dio().get(url);
    NewsBean data = NewsBean.fromJson(response.data);

    ///成功
    if (data.code == 0) {
      var _slideData = data.msg.slide;
      var _listData = data.msg.news.data;
      totalPage = data.msg.news.total;
      setState(() {
        if (!isLoadMore) {
          _dataList = _listData;
          _slidelist = _slideData;
        } else {
          _dataList.addAll(_listData);
        }
      });
    }
  }

  ///刷新
  Future<void> refresh() async {
    _dataList.clear();
    curPage = 1;
    getData(false);
  }

  creatSubView(BuildContext context, int index) {
    Data data = _dataList[index - 1];

    ///左边标题栏
    var titleRow = Text(data.summary,
        maxLines: 2,
        overflow: TextOverflow.ellipsis, //显示省略号
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.black,
        ));

    ///左边底部栏
    var bottomRow = Row(
      children: <Widget>[
        Container(
          height: 20.0,
          width: 20.0,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              color: const Color(0xFFECECEC),
              shape: BoxShape.circle,
              image: DecorationImage(image: NetworkImage(data.authorImg))),
//          child: Image.network(data.authorImg),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5.0, 0, 0, 0),
          child: Text(
            data.timeStr,
            style: subtitleStyle,
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Image.asset('./images/ic_comment.png', height: 20.0, width: 20.0),
              Text('${(data.commCount)}', style: subtitleStyle),
            ],
          ),
        )
      ],
    );

    ///右边图片栏
    var rightPic = Container(
      margin: const EdgeInsets.all(14.0),
      height: 62.0,
      width: 68.0,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
            color: const Color(0xFFECECEC),
            width: 2.0,
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: data.thumb == null || data.thumb.length == 0
                ? ExactAssetImage('./images/ic_img_default.jpg')
                : NetworkImage(data.thumb),
          )),
    );

    var mainRow = Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[titleRow, bottomRow],
              ),
            )),
        rightPic
      ],
    );

    ///水波纹
    return InkWell(
      child: mainRow,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetailPage(id: data.detailUrl)));
      },
    );
  }
}
