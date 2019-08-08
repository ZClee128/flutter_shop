import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/common/common.dart';
import 'package:flutter_shop/login/login_router.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import 'package:flutter_shop/util/image_utils.dart';
import 'package:flutter_shop/util/utils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:rxdart/rxdart.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _status = 0;
  List<String> _guideList = [
    "app_start_1",
    "app_start_2",
    "app_start_3",
  ];
// Stream就会开始生成事件，以便每次都通知活动的StreamSubscription对象：
  StreamSubscription _subscription;

  @override
  void initState() {
    _initSplash();
    super.initState();
  }

  void _initAsync() async {
    // 存储数据获取数据
    await SpUtil.getInstance();
    if (SpUtil.getBool(Constant.key_guide, defValue: true)) {
      SpUtil.putBool(Constant.key_guide, false);
      _initGuide();
    } else {
      _goLogin();
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _initGuide() {
    setState(() {
      _status = 1;
    });
  }

  void _initSplash() {
    _subscription =
        Observable.just(1).delay(Duration(milliseconds: 2000)).listen((_) {
      _initAsync();
    });
  }

  _goLogin() {
    NavigatorUtils.push(context, LoginRouter.loginPage, replace: true);
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          /**
 * 控制child是否显示
 *
    当offstage为true，控件隐藏； 当offstage为false，显示；
    当Offstage不可见的时候，如果child有动画等，需要手动停掉，Offstage并不会停掉动画等操作。

    const Offstage({ Key key, this.offstage = true, Widget child })
 */
          Offstage(
            offstage: !(_status == 0),
            child: Image.asset(
              Utils.getImgPath("start_page", format: 'jpg'),
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Offstage(
            offstage: !(_status == 1),
            child: Swiper(
              itemCount: _guideList.length,
              loop: false,
              itemBuilder: (_, index) {
                return loadAssetImage(_guideList[index],
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill);
              },
              onTap: (index) {
                if (index == _guideList.length - 1) {
                  _goLogin();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
