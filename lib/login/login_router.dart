
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/login/login_page.dart';
import 'package:flutter_shop/login/register_page.dart';
import 'package:flutter_shop/login/reset_password_page.dart';
import 'package:flutter_shop/login/sms_login_page.dart';
import 'package:flutter_shop/login/update_password_page.dart';
import 'package:flutter_shop/routers/router_init.dart';


class LoginRouter implements IRouterProvider {
  static String loginPage = "/login";
  static String registerPage = "/login/register";
  static String smsLoginPage = "/login/smsLogin";
  static String resetPasswordPage = "/login/resetPassword";
  static String updatePasswordPage = "/login/updatePassword";

  @override
  void initRouter(Router router) {
    router.define(loginPage, handler: Handler(handlerFunc: (_, params) => LoginPage()));
    router.define(registerPage, handler: Handler(handlerFunc: (_, params) => Register()));
    router.define(smsLoginPage, handler: Handler(handlerFunc: (_, params) => SMSLogin()));
    router.define(resetPasswordPage, handler: Handler(handlerFunc: (_, params) => ResetPassword()));
    router.define(updatePasswordPage, handler: Handler(handlerFunc: (_, params) => UpdatePasswordPage()));
  }
}