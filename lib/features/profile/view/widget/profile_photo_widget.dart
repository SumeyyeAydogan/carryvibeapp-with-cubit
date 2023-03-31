import 'package:carryvibeapp/core/constants/image_manager.dart';
import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePhotoWidget extends StatelessWidget {
  ProfilePhotoWidget({
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
            padding: context.paddingHighVerticalAndHorizontal,//paddingMediumVertical,
            child: CircleAvatar(
              maxRadius: 50,
              child: SvgPicture.asset(
                ImageManager.instance.appleIcon,
                fit: BoxFit.cover,
              ),
            )));
  }
}      