import 'package:flutter/cupertino.dart';

class PageNavigator {
  PageNavigator({required this.ctx});
  final BuildContext ctx;

  Future nextPage({required Widget page}) {
    return Navigator.push(ctx, CupertinoPageRoute(builder: (context) => page));
  }

  void nextPageOnly({required Widget page}) {
    Navigator.pushAndRemoveUntil(
      ctx,
      CupertinoPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  void back(BuildContext context) {
    return Navigator.pop(context);
  }
}
