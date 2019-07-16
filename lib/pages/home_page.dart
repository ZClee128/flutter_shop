import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../service/service_method.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活'),
      ),
      body: FutureBuilder(
        future: getHomePageContent(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var data = jsonDecode(snapshot.data.toString());
            List<Map> swiperList = (data['data']['List'] as List).cast();
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
    );
  }
}


class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  const SwiperDiy({Key key,this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.0,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network("${swiperDataList[index]['image']}",fit:BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}