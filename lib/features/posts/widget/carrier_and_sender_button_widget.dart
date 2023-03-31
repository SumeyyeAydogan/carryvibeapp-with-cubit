// import 'package:auto_route/auto_route.dart';
// import 'package:carryvibeapp/core/extension/context_extension.dart';
// import 'package:carryvibeapp/core/init/theme/carry_vibe_theme.dart';
// import 'package:carryvibeapp/product/router/app_router.dart';
// import 'package:carryvibeapp/product/widgets/button/constants.dart';
// import 'package:carryvibeapp/product/widgets/button/custom_button.dart';
// import 'package:carryvibeapp/product/widgets/button/custom_elevated_button.dart';
// import 'package:flutter/material.dart';

// class CarrierAndSenderButtonWidget extends StatelessWidget {
//   Color color;
//   CarrierAndSenderButtonWidget({
//     this.color = Colors.teal,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 20, bottom: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           CustomButton(
//             color: CarryVibeTheme.defaultTheme.colorScheme.secondary, //context.theme.colorScheme.secondary,
//             onPressed: () {
//               context.router.popAndPush(const CarrierPostRoute());
//             },
//             title: ButtonConstants.CARRIER,
//             width: context.width * 0.45,
//           ),
//           CustomButton(
//             isSelect: isSelect2,
//             color: CarryVibeTheme.defaultTheme.colorScheme.primary, //context.theme.colorScheme.primary,
//             onPressed: () {
//               context.router.popAndPush(const SenderPostRoute());
//             },
//             title: "Gönderici",
//             width: context.width * 0.45,
//           )
//         ],
//       ),
//     );
//   }
// }
