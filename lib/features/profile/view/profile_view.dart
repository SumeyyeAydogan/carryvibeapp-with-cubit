import 'package:auto_route/auto_route.dart';
import 'package:carryvibeapp/core/constants/image_manager.dart';
import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/core/init/theme/carry_vibe_theme.dart';
import 'package:carryvibeapp/features/bottom_sheets/getting_sheet.dart';
import 'package:carryvibeapp/features/profile/cubit/profile_cubit.dart';
import 'package:carryvibeapp/product/router/app_router.dart';
import 'package:carryvibeapp/product/widgets/user_properties_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final mockListTitle = [
    "Ödeme Yap",
    "Kampanya Kodları",
    "Sözleşmeler",
    "Ayarlar",
    "Çıkış Yap"
  ];

  final List<Widget> list = [
    paySheet(),
    offerSheet(),
    contractSheet(),
    settingsSheet(),
  ];

  final mockListIcon = [
    ImageManager.instance.payIcon,
    ImageManager.instance.offersIcon,
    ImageManager.instance.contractsIcon,
    ImageManager.instance.settingsIcon,
    ImageManager.instance.exitIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
          body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ImageManager.instance.introductionBg)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.transparent,
                )),
            _BodyBuildWidget(
                list: list,
                mockListTitle: mockListTitle,
                mockListIcon: mockListIcon),
          ],
        ),
      )),
    );
  }
}

class _BodyBuildWidget extends StatelessWidget {
  const _BodyBuildWidget({
    Key? key,
    required this.list,
    required this.mockListTitle,
    required this.mockListIcon,
  }) : super(key: key);

  final List<Widget> list;
  final List<String> mockListTitle;
  final List<String> mockListIcon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 9,
        child: RefreshIndicator(
          onRefresh: () async {
            await context.read<ProfileCubit>().getUserProfile();
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            ),
            child: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state is ProfileError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)));
                }
              },
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProfileCompleted) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 0,
                          child: Padding(
                              padding: context.paddingMediumVertical,
                              child: CircleAvatar(
                                  maxRadius: 40,
                                  child: ClipOval(
                                    child: state.model.profileImage != ""
                                        ? Image.network(
                                            state.model.profileImage!)
                                        : SvgPicture.asset(
                                            ImageManager.instance.googleIcon,
                                            fit: BoxFit.cover,
                                          ),
                                  )))),
                      _UserTitleWidget(fullName: state.model.fullName ?? ""),
                      /* IconButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            context.router.pushAndPopUntil(
                                const IntroductionRoute(),
                                predicate: (route) => false);
                          },
                          icon: const Icon(Icons.exit_to_app)), */
                      UserFeatureWidgets(
                        isRate: false,
                        carrierValue: state.model.transportTotalNumber,
                        gainValue: state.model.gainTotalNumber,
                        ratingValue: state.model.rating,
                        senderValue: state.model.senderTotalNumber,
                      ),
                      _UserProfileListWidgets(
                          list: list,
                          mockListTitle: mockListTitle,
                          mockListIcon: mockListIcon),
                    ],
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ));
  }
}

class _UserProfileListWidgets extends StatelessWidget {
  const _UserProfileListWidgets({
    Key? key,
    required this.list,
    required this.mockListTitle,
    required this.mockListIcon,
  }) : super(key: key);

  final List<Widget> list;
  final List<String> mockListTitle;
  final List<String> mockListIcon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 8,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: mockListTitle.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: context.paddingHighHorizontal,
              child: InkWell(
                onTap: () {
                  if (index == 4) {
                    quit(context);
                  } else {
                    showModalBottomSheet(
                        useRootNavigator: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                        ),
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => list[index]);
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 0,
                  color: CarryVibeTheme
                      .defaultTheme.colorScheme.secondaryContainer,
                  child: Padding(
                    padding: context.paddingMediumLowVertical,
                    child: ListTile(
                      title: Text(
                        mockListTitle[index],
                        style: CarryVibeTheme.defaultTheme.textTheme.headline3,
                      ),
                      leading: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Padding(
                          padding: context.paddingLow,
                          child: SvgPicture.asset(mockListIcon[index]),
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

void quit(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  context.router
      .pushAndPopUntil(const IntroductionRoute(), predicate: (route) => false);
}

class _UserTitleWidget extends StatelessWidget {
  final String fullName;
  const _UserTitleWidget({
    Key? key,
    required this.fullName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 0,
        child: Padding(
          padding: context.paddingMediumVertical,
          child: Text(
            fullName,
            style: CarryVibeTheme.defaultTheme.textTheme.headline1,
          ),
        ));
  }
}
