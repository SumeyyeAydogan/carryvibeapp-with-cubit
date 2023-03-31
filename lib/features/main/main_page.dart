import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/features/bottom_sheets/getting_sheet.dart';
import 'package:carryvibeapp/features/posts/cubit/carrier_and_sender_cubit.dart';
import 'package:carryvibeapp/features/posts/view/add_post_view.dart';
import 'package:carryvibeapp/product/router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carryvibeapp/features/posts/view/posts_view.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool? isCarrierPage = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CarrierAndSenderCubit, CarrierAndSenderState>(
        builder: (context, state) {
      return AutoTabsScaffold(
        extendBody: true,
        /* appBarBuilder: (_, tabsRouter) => AppBar(
             backgroundColor: Colors.white,
             title: Text(tabsRouter.current.name),
             centerTitle: true,
             actions: [
               IconButton(
                   onPressed: () async {                 
                     await FirebaseAuth.instance.signOut();
                     context.router.pushAndPopUntil(const IntroductionRoute(), predicate: (route) => false);
                   },
                   icon: const Icon(Icons.exit_to_app)),
            ],
           ), */
        backgroundColor: Colors.white,
        routes: const [
          HomeTabRouter(),
          CarrierTabRouter(),
          ProfileTabRouter(),
          DeliveryTabRouter(),
        ],
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.theme.colorScheme.secondary,
          onPressed: () {
            final controller = BlocProvider.of<CarrierAndSenderCubit>(context);
            context.read<CarrierAndSenderCubit>();
            if (controller.tabController?.index == 0) {
              print("taşıyıcı");
            } else {
              print("gönderici");
              print(controller.tabController?.index);
            }
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (
                  context,
                ) => AddPostPage()
                    //isCarrierPage! ? AddTravelPage() : AddProductPage()
                    );
          },
          tooltip: 'Increment',
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBuilder: (_, tabsRouter) {
          return AnimatedBottomNavigationBar(
            activeIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.smoothEdge,
            borderColor: Colors.white,
            activeColor: context.theme.colorScheme.error,
            icons: const [
              Icons.home,
              Icons.delivery_dining,
              Icons.person,
              Icons.fire_truck
            ],
          );
        },
      );
    });
  }
}
// return BottomNavigationBar(
//           currentIndex: tabsRouter.activeIndex,
//           onTap: tabsRouter.setActiveIndex,
//           items: const [
//             BottomNavigationBarItem(label: "Anasayfa", icon: Icon(Icons.person)),
//             BottomNavigationBarItem(label: "Profil", icon: Icon(Icons.person)),
//           ],
//         );


