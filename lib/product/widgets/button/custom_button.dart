import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/core/init/theme/carry_vibe_theme.dart';
import 'package:carryvibeapp/core/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback? onPressed;
  final String title;
  final bool isSelect;
  final double? width;
  Color buttonColor;
  CustomButton(
      {Key? key,
      required this.onPressed,
      required this.title,
      this.isSelect = false,
      this.width,
      this.buttonColor = const Color(0xFFED6B5E),
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          height: context.height * 0.05,
          width: width,
          decoration: BoxDecoration(
            color: isSelect
                ? buttonColor//CarryVibeTheme.defaultTheme.colorScheme.secondary
                : CarryVibeTheme.defaultTheme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Text(
            title,
            style: isSelect ? whiteBold15 : blackBold15,
          )),
        ));
  }
}
