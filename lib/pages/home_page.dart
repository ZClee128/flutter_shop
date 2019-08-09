import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/widgets/app_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../service/service_method.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  // String homePageContent='正在获取数据';

  // @override
  // void initState() {
  //   getHomePageContent().then((val){
  //     setState(() {
  //       homePageContent = val.toString();
  //     });
  //   });
  //   super.initState();
  // }

  @override
  bool get wantKeepAlive => true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: '首页',
        isBack: false,
      ),
      body: FutureBuilder(
        future: getHomePageContent(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('data>>'+snapshot.data.toString());
            var data = json.decode(snapshot.data.toString());
            List<Map> swiperList = (data['data'] as List).cast();
            return Column(
              children: <Widget>[
                SwiperDiy(swiperDataList: swiperList,)
              ],
            );
          }else{
            return Center(
              child: Text('加载中...'),
            );
          }
        },
      ),
      // body: Text('ces'),
    );
  }
}


class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  const SwiperDiy({Key key,this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {    
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network("${swiperDataList[index]['main_pic']}",fit:BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}