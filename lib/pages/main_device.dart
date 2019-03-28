import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

///主件
class MainDevice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainDeviceState();
  }
}

class _MainDeviceState extends State<MainDevice> {
//
  List<String> _imageList;
  bool select = false;

  @override
  void initState() {
    super.initState();
    _imageList = [
      'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c3e1d90c.jpg',
      'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c40f3bc2.jpg',
      'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c4406144.jpg',
      'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c46823f8.jpg',
      'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c48c73d0.jpg',
      'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c4b4dc2f.jpg',
      'http://pic1.win4000.com/wallpaper/2019-02-15/5c664c51a2a45.jpg',
      'http://pic1.win4000.com/wallpaper/2019-02-14/5c65107a0ee05.jpg',
      'http://pic1.win4000.com/wallpaper/2019-02-14/5c65108043791.jpg',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter 练习',
          style: TextStyle(fontSize: 17.0),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: _imageList.length + 1,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return 0 == index
                ? creatBannerView()
                : ListTile(
                    selected: select,
                    title: Text('title $index'),
                    subtitle: Text('subtitle $index'),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(_imageList[index - 1]),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.green,
                    ),

                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('提示'),
                              content: Text('你当前选择了$index'),
                              actions: <Widget>[
                                FlatButton(
                                    child: Text('确定',
                                        style: TextStyle(color: Colors.black)),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                FlatButton(
                                    child: Text(
                                      '取消',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ],
                            );
                          });
                    },
                  );
          }),
    );
  }

  ///创建广告栏
  Widget creatBannerView() {
    return Container(
      height: 180.0,
      padding: EdgeInsets.all(5.0),
      child: Swiper(
        autoplay: true,
        pagination: SwiperPagination(),
        itemCount: _imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _imageList[index],
            fit: BoxFit.fill,
            height: 180.0,
          );
        },
      ),
    );
  }
}
