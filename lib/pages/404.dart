import 'package:flutter/material.dart';
import 'package:flutter_shop/widgets/state_layout.dart';

class WidgetNotFound extends StatelessWidget {
  const WidgetNotFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面不存在'),
      ),
      body: StateLayout(
        type: StateType.account,
        hintText: '页面不存在',
      ),
    );
  }
}