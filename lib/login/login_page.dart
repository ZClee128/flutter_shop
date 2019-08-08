import 'package:flustars/flustars.dart' as Flustars;
import 'package:flutter/material.dart';
import 'package:flutter_shop/common/common.dart';
import 'package:flutter_shop/login/login_router.dart';
import 'package:flutter_shop/res/colors.dart';
import 'package:flutter_shop/res/styles.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import 'package:flutter_shop/util/utils.dart';
import 'package:flutter_shop/widgets/app_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_shop/widgets/my_button.dart';
import 'package:flutter_shop/widgets/text_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// 定义controller
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();

  bool _isClick = false;

  @override
  void initState() {
// 监听输入框变化
    _nameController.addListener(_verify);
    _passwordController.addListener(_verify);
    _nameController.text = Flustars.SpUtil.getString(Constant.phone);
    super.initState();
  }

  void _verify() {
    String name = _nameController.text;
    String pwd = _passwordController.text;
    bool isClick = true;

    if (name.isEmpty || name.length < 11) {
      isClick = false;
    }
    if (pwd.isEmpty || pwd.length < 6) {
      isClick = false;
    }

    /// 状态不一样在刷新，避免重复不必要的setState
    if (isClick != _isClick) {
      setState(() {
        _isClick = isClick;
      });
    }
  }

  void _login() {
    Flustars.SpUtil.putString(Constant.phone, _nameController.text);
    // NavigatorUtils.push(context, )
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: false,
        actionName: '验证码登录',
        onPressed: () {
          // NavigatorUtils.push(context, path)
        },
      ),
      body: defaultTargetPlatform == TargetPlatform.iOS
          ? FormKeyboardActions(
              child: _buildBody(),
            )
          : SingleChildScrollView(
              child: _buildBody(),
            ),
    );
  }

  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "密码登录",
            style: TextStyles.textBoldDark26,
          ),
          Gaps.vGap16,
          MyTextField(
            focusNode: _nodeText1,
            controller: _nameController,
            maxLength: 11,
            keyboardType: TextInputType.phone,
            hintText: "请输入账号",
          ),
          Gaps.vGap10,
          MyTextField(
            focusNode: _nodeText2,
            config: Utils.getKeyboardActionsConfig([_nodeText1, _nodeText2]),
            isInputPwd: true,
            controller: _passwordController,
            maxLength: 16,
            hintText: "请输入密码",
          ),
          Gaps.vGap10,
          Gaps.vGap15,
          MyButton(
            onPressed: _isClick ? _login : null,
            text: "登录",
          ),
          Container(
            height: 40.0,
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: Text(
                '忘记密码',
                style: TextStyles.textGray12,
              ),
              onTap: () {
                NavigatorUtils.push(context, LoginRouter.resetPasswordPage);
              },
            ),
          ),
          Gaps.vGap16,
          Container(
              alignment: Alignment.center,
              child: GestureDetector(
                child: Text(
                  '还没账号？快去注册',
                  style: TextStyle(color: Colours.text_blue),
                ),
                onTap: () {
                  NavigatorUtils.push(context, LoginRouter.registerPage);
                },
              ))
        ],
      ),
    );
  }
}
