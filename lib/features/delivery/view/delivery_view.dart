import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:carryvibeapp/core/constants/image_manager.dart';
import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/features/delivery/cubit/delivery_cubit.dart';
import 'package:carryvibeapp/features/posts/cubit/carrier_and_sender_cubit.dart';
import 'package:carryvibeapp/features/posts/cubit/carrier_orders_cubit.dart';
import 'package:carryvibeapp/features/posts/cubit/sender_orders_cubit.dart';
import 'package:carryvibeapp/features/posts/model/post_model.dart';
import 'package:carryvibeapp/product/router/app_router.dart';
import 'package:carryvibeapp/product/widgets/button/custom_button.dart';
import 'package:carryvibeapp/product/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../product/widgets/button/constants.dart';

class DeliveryPage extends StatefulWidget {
  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage>
    with TickerProviderStateMixin {
  late List<Post> allPosts;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeliveryCubit(0),
      child: BlocConsumer<DeliveryCubit, DeliveryState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is DeliveryInitial) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(ImageManager.instance.introductionBg)),
              ),
              child: Column(
                children: [
                  const Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Column(
                        children: [
                          Expanded(child: _DeliveryBuildList()),
                          if (state.uploadPhoto != 2) 
                          DeliveryButtons(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class DeliveryButtons extends StatelessWidget {
  const DeliveryButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeliveryCubit(0),
      child: BlocConsumer<DeliveryCubit, DeliveryState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is DeliveryInitial) {
            return Expanded(
              flex: 0,
              child: Padding(
                padding: context.paddingExtraHighVertical,
                child: Row(children: [
                  CustomButton(
                    isSelect: state.uploadPhoto == 0 ? true : false,
                    onPressed: () {
                      context.read<DeliveryCubit>().changeValue(value: 1);
                    },
                    title: ButtonConstants.TAKE_PHOTO_START,
                    width: context.width * 0.45,
                  ),
                  CustomButton(
                    isSelect: state.uploadPhoto == 1 ? true : false,
                    onPressed: () {
                      context.read<DeliveryCubit>().changeValue(value: 2);
                    },
                    title: ButtonConstants.TAKE_PHOTO_FINISH,
                    width: context.width * 0.45,
                  ),
                ]),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class _DeliveryBuildList extends StatelessWidget {
  const _DeliveryBuildList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SenderOrdersCubit(),
      child: BlocConsumer<SenderOrdersCubit, SenderOrdersState>(
        listener: (context, state) {
          if (state is SenderOrdersError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is SenderOrdersCompleted) {
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.senderOrdersModel.length,
                    itemBuilder: (context, index) {
                      if (state.senderOrdersModel[index].status == 0) {
                        return const SizedBox();
                      }
                      int _pageNumber = 2;
                      return Item(
                          pageNumber: _pageNumber,
                          selectPost: Post(
                            name: state.senderOrdersModel[index].title,
                            /* startLocation: state.senderOrdersModel[index].deliveryLocation,
                            finishLocation: 'Istanbul', */
                            image: (index + 1).toString(),
                          ),
                          widget: AddWidget());
                    },
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                )
              ],
            );
          }
          if (state is SenderOrdersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

/* class DeliveryPage extends StatelessWidget {
  late List<Post> allPosts;
  final int pageNum = 3;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: CustomPageContainer(
        flex: 7,
        padding: context.width * 0.01,
        showCustomElevationButton: true,
        buttonText: ButtonConstants.TAKE_PHOTO_START_FINISH,
        title: "Fotoğrafı çek, teslimatı başlat/bitir ve kazan!",
        content: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: Strings.CARRIER_NAME.length,
                itemBuilder: (context, index) {
                  return Item(
                      selectPost: Post(
                        product: Strings.PRODUCT[index],
                        /* startLocation: Strings.START_LOCATION[index],
                        finishLocation: Strings.FINISH_LOCATION[index], */
                        image: (index + 1).toString(),
                        price: 12,
                      ),
                      widget: const AddWidget());
                },
              ),
              //CustomButton(onPressed: (){}, title: "Fotoğraf çek & teslimatı başlat/bitir", color: context.theme.colorScheme.error),
              /* CustomCircularButton(
                primaryColor: context.theme.colorScheme.primary,
                minimumSize: Size(context.width, 45),
              ), */
            ],
          ),
        ),
      ),
    );
  }
} */
/**
 * FirebaseFirestore firestore = FirebaseFirestore.instance;
 * 
 * Item(
                      selectPost: Post(
                        product: Strings.PRODUCT[index],
                        /* startLocation: Strings.START_LOCATION[index],
                        finishLocation: Strings.FINISH_LOCATION[index], */
                        image: (index + 1).toString(),
                        price: 12,
                      ),
                      widget: const AddWidget());

    "Fotoğrafı çek, teslimatı başlat/bitir ve kazan!"                  
 */