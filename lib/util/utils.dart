import 'package:flutter/material.dart';
import 'package:flutter_shop/util/toast.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static String getImgPath(String name,{String format: 'png'}){
    return 'assets/images/$name.$format';
  }

  static void launchTelURL(String phone) async {
    String url = 'tel:'+ phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Toast.show('拨号失败！');
    }
  }

  static KeyboardActionsConfig getKeyboardActionsConfig(List<FocusNode> list){
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: List.generate(list.length, (i) => KeyboardAction(
        focusNode: list[i],
        closeWidget: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text("关闭"),
        ),
      )),
    );
  }
}