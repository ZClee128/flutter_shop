import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoApp(
          theme: CupertinoThemeData(
            primaryColor: CupertinoColors.white
          ),
        ),
      ),
    );
  }
}