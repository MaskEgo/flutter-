import 'package:flutter/material.dart';
import 'package:flutter_trans/api/http_utils.dart';
import 'package:flutter_trans/model/project_bean.dart';
import 'package:flutter_trans/pages/project_detail_page.dart';

class ProjectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProjectPage();
  }
}

class _ProjectPage extends State<ProjectPage> {
  List<Data> _dataList = List();

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (_dataList.length==0) {
      return Center(child: CircularProgressIndicator());
    } else {
      return DefaultTabController(
          child: Scaffold(
            appBar: AppBar(
              title: Text('项目'),
              centerTitle: true,
              bottom: TabBar(
                tabs: _buildTabs(),
                indicatorColor: Colors.blueAccent,
                isScrollable: true,
              ),
            ),
            body: TabBarView(
              children: _buildTabBarView(),
            ),
          ),
          length: _dataList.length);
    }
  }

  ///获取tabs
  List<Tab> _buildTabs() {
    List<Tab> _tabList = [];
    for (var value in _dataList) {
      _tabList.add(Tab(
        text: value.name.replaceAll('&amp;', ''),
      ));
    }
    return _tabList;
  }

  ///获取tabview
  _buildTabBarView() {
    List<Widget> tabBarView = [];
    for (var value in _dataList) {
      tabBarView.add(ProjectDetailPage(
        id: value.id,
      ));
    }
    return tabBarView;
  }

  void getData() {
    HttpUtils().getProgectCatgory().then((response) {
      var dataList = ProjectBean.fromJson(response.data);
      setState(() {
        _dataList = dataList.data;
      });
    });
  }
}
