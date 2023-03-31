import 'package:auto_route/auto_route.dart';
import 'package:carryvibeapp/core/constants/image_manager.dart';
import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/product/router/app_router.dart';
import 'package:carryvibeapp/product/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class IntroductionPage extends StatelessWidget {
  final String login = "Giriş Yap";
  final String register = "Kayıt Ol";
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: context.height,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(ImageManager.instance.introductionBg), fit: BoxFit.cover)),
      child: Padding(
        padding: context.paddingBottomMedium,
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          CustomElevationButton(
              primaryColor: context.theme.colorScheme.secondary,
              minimumSize: context.mediumSize,
              onPressed: () async {
                context.pushRoute(const LoginRoute());
              },
              title: Text(login)),
          const SizedBox(
            height: 10,
          ),
          CustomElevationButton(
              primaryColor: context.theme.colorScheme.primary,
              minimumSize: context.mediumSize,
              onPressed: () async {
                context.pushRoute(const RegisterRoute());
              },
              title: Text(register)),
        ]),
      ),
    );
  }
}
