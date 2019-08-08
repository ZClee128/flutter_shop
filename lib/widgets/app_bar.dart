import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/res/colors.dart';
import 'package:flutter_shop/res/dimens.dart';
import 'package:flutter_shop/res/styles.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String title;
  final String centerTitle;
  final String backImg;
  final String actionName;
  final VoidCallback onPressed;
  final bool isBack;

  const MyAppBar({
    Key key,
    this.backgroundColor: Colors.white,
    this.title: "",
    this.centerTitle: "",
    this.backImg: "assets/images/ic_back_black.png",
    this.isBack: true,
    this.actionName: "",
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayStyle _overlayStyle = ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark;
    // 更改全面屏手机底部虚拟按钮背景颜色（默认为黑色）以及状态栏颜色 （AnnotatedRegion）
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Material(
        color: backgroundColor,
        // 刘海手机安全区域
        child: SafeArea(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: centerTitle.isEmpty ? Alignment.centerLeft : Alignment.center,
                    width: double.infinity,
                    child: Text(
                      title.isEmpty ? centerTitle : title,
                      style: TextStyle(
                        fontSize: Dimens.font_sp18,
                        color: _overlayStyle == SystemUiOverlayStyle.light ? Colors.white : Colours.text_dark
                      ),
                    ),
                    //顶部导航栏与两侧的距离,horizontal表示水平方向
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  )
                ],
              ),
              isBack ? IconButton(
                onPressed: (){
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.maybePop(context);
                },
                padding: EdgeInsets.all(12.0),
                icon: Image.asset(
                  backImg,
                  color: _overlayStyle == SystemUiOverlayStyle.light ? Colors.white : Colours.text_dark,
                ),
              ) : Gaps.empty,
              Positioned(
                right: 0.0,
                child: Theme(
                  data: ThemeData(
                    buttonTheme: ButtonThemeData(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      minWidth: 60.0
                    )
                  ),
                  child: actionName.isEmpty ? Container() : FlatButton(
                    child: Text(actionName),
                    textColor: _overlayStyle == SystemUiOverlayStyle.light ? Colors.white : Colours.text_dark,
                    highlightColor: Colors.transparent,
                    onPressed: onPressed,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(48.0);
}
