import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:carryvibeapp/core/constants/image_manager.dart';
import 'package:carryvibeapp/core/extension/context_extension.dart';
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

import '../../../product/widgets/button/constants.dart';

class CarrierPostPage extends StatefulWidget {
  @override
  State<CarrierPostPage> createState() => _CarrierPostPageState();
}

class _CarrierPostPageState extends State<CarrierPostPage>
    with TickerProviderStateMixin {
  late List<Post> allPosts;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CarrierAndSenderCubit(TabController(length: 2, vsync: this)),
      child: BlocConsumer<CarrierAndSenderCubit, CarrierAndSenderState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CarrierAndSenderInitial) {
            return DefaultTabController(
              initialIndex: 0,
              length: 2,
              child: Container(
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
                            Expanded(
                              flex: 0,
                              child: Padding(
                                padding: context.paddingMediumVertical,
                                child: TabBar(
                                    indicatorColor: Colors.transparent,
                                    controller: state.tabController,
                                    tabs: [
                                      CustomButton(
                                        isSelect:
                                            state.tabController?.index == 0
                                                ? true
                                                : false,
                                        onPressed: () {
                                          context
                                              .read<CarrierAndSenderCubit>()
                                              .changeIndex(index: 0);
                                        },
                                        title: ButtonConstants.CARRIER,
                                        width: context.width * 0.45,
                                      ),
                                      CustomButton(
                                        isSelect:
                                            state.tabController?.index == 0
                                                ? false
                                                : true,
                                        onPressed: () {
                                          context
                                              .read<CarrierAndSenderCubit>()
                                              .changeIndex(index: 1);
                                        },
                                        title: ButtonConstants.SENDER,
                                        width: context.width * 0.45,
                                      ),
                                    ]),
                              ),
                            ),
                            Expanded(
                              child: TabBarView(
                                  controller: state.tabController,
                                  children: const [
                                    _CarrierBuildList(),
                                    _SenderBuildList()
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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

//CarrierBuildList
class _CarrierBuildList extends StatelessWidget {
  const _CarrierBuildList({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CarrierOrdersCubit(),
        child: BlocConsumer<CarrierOrdersCubit, CarrierOrdersState>(
            listener: (context, state) {
          if (state is CarrierOrdersError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        }, builder: (context, state) {
          if (state is CarrierOrdersCompleted) {
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.carrierOrdersModel.length,
                    itemBuilder: (context, index) {
                      int _pageNumber = 1;
                      return Item(
                          pageNumber: _pageNumber,
                          selectPost: Post(
                            name: state.carrierOrdersModel[index].title,
                            startLocation: state
                                .carrierOrdersModel[index].deliveryLocation,
                            finishLocation: state
                                .carrierOrdersModel[index].depatureLocation,
                            //image: (index + 1).toString(),
                          ),
                          widget: DateWidget(
                            selectPost: Post(
                              date: state.carrierOrdersModel[index].date![0],
                              time: state.carrierOrdersModel[index].date![1],
                            ),
                          ));
                    },
                  ),
                ),
                //Expanded(child: MapSample()),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            );
          }
          if (state is CarrierOrdersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox();
        }));
  }
}

class _SenderBuildList extends StatelessWidget {
  const _SenderBuildList({
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
                      int _pageNumber = 1;
                      return Item(
                          pageNumber: _pageNumber,
                          selectPost: Post(
                            name: state.senderOrdersModel[index].title,
                            startLocation: state.senderOrdersModel[index].deliveryLocation,
                            finishLocation: state.senderOrdersModel[index].depatureLocation,
                            //image: (index + 1).toString(),
                          ),
                          widget: SizeTypeAndPriceWidget(
                              selectPost: Post(
                            sizeType: state.senderOrdersModel[index].sizeType,
                          )));
                    },
                  ),
                ),
                //Expanded(child: MapSample()),
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

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
