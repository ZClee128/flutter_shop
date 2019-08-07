import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/res/colors.dart';
import 'package:flutter_shop/routers/application.dart';
import 'pages/index_page.dart';
import 'package:oktoast/oktoast.dart';
import 'dart:io';
import 'package:flutter_shop/routers/routers.dart';
void main() {
  runApp(MyApp());

  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
 
class MyApp extends StatelessWidget {

  MyApp(){
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'deer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colours.app_main
        ),
        home: IndexPage(),
        onGenerateRoute: Application.router.generator,
      ),      
      backgroundColor: Colors.black54,
      textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      radius: 20.0,
      position: ToastPosition.bottom
    );
  }
}