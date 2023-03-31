import 'package:auto_route/auto_route.dart';
import 'package:carryvibeapp/product/widgets/notification.dart';
import 'package:flutter/material.dart';

class topBar extends StatefulWidget {
  const topBar({
    Key? key,
  }) : super(key: key);

  @override
  State<topBar> createState() => _topBarState();
}

class _topBarState extends State<topBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomNotificationWidget(number: 1),
      ],
    );
  }
}
