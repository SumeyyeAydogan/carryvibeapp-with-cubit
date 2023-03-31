import 'package:auto_route/auto_route.dart';
import 'package:badges/badges.dart';
import 'package:carryvibeapp/product/router/app_router.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomNotificationWidget extends StatefulWidget {
  final number;
  const CustomNotificationWidget({Key? key, required this.number})
      : super(key: key);

  @override
  State<CustomNotificationWidget> createState() =>
      _CustomNotificationWidgetState();
}

class _CustomNotificationWidgetState extends State<CustomNotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.router.navigate(NotificationsRoute());
      },
      child: Badge(
        badgeContent: Text("${widget.number}"),
        child: Icon(
          FontAwesomeIcons.bell,
          color: Colors.black,
        ),
      ),
    );
  }
}