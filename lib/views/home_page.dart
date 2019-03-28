import 'package:flutter/material.dart';
import 'package:flutter_trans/pages/main_device.dart';
import 'package:flutter_trans/pages/news_look.dart';
import 'package:flutter_trans/pages/project_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  static const List<BottomNavigationBarItem> _BarItemlist = [
//    BottomNavigationBarItem(icon: Icon(Icons.menu), title: Text('主件')),
    BottomNavigationBarItem(icon: Icon(Icons.fiber_new), title: Text('资讯')),
    BottomNavigationBarItem(icon: Icon(Icons.payment), title: Text('项目')),
    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('我的')),
  ];

  int _currentIndx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndx,
        children: <Widget>[ News(),ProjectPage(),MainDevice()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _BarItemlist,
        currentIndex: _currentIndx,
        onTap: (index) {
          setState(() {
            _currentIndx = index;
          });
        },
      ),
    );
  }

  Widget buildSearchBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text('Flutter 练习'),
        FlatButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 24.0,
              color: Colors.white,
            ),
            label: Text(
              '搜索',
              style: TextStyle(
                fontSize: 14.0,
              ),
            ))
      ],
    );
  }
}
