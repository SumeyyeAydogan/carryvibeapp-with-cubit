import 'package:carousel_slider/carousel_slider.dart';
import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/product/widgets/notification.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final photoList = [
    "assets/images/page1.png",
    "assets/images/page2.png",
    "assets/images/page3.png",
    "assets/images/page4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: context.height*0.05),
          Padding(padding: const EdgeInsets.all(15.0), child: topBarMenu()),
          buildSlider(),
          SizedBox(height: context.height*0.05),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Geçmiş İşlemler",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.height*0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tarih",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: context.height*0.01,
                          ),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.calendar),
                              SizedBox(
                                width: context.width*0.01,
                              ),
                              Text("25.09.2022")
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saat",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: context.height*0.01,
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.clock,
                                color: Colors.orange,
                              ),
                              SizedBox(
                                width: context.width*0.01,
                              ),
                              Text("12:00")
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: context.height*0.03,
          ),
          Row(
            children: [
              SizedBox(
                width: context.width*0.05,
              ),
              Text(
                "Güzergah Bilgisi",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            width: context.height*0.2,
            height: context.height*0.02,
          ),
          Container(
            margin: EdgeInsets.only(left: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      // ignore: deprecated_member_use
                      FontAwesomeIcons.dotCircle,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: context.width*0.05,
                    ),
                    Expanded(
                        child: RichText(
                      text: TextSpan(
                        text: 'Kalkış Yeri\n',
                        style: TextStyle(color: Colors.grey),
                        children: const <TextSpan>[
                          TextSpan(
                              text:
                                  'Reşitpaşa, Katar Cd No:4 D:1101, 34467 Sarıyer/İstanbul',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ))
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 11.5),
                  height: context.height*0.03,
                  decoration: BoxDecoration(
                    border: RDottedLineBorder(
                        left: BorderSide(
                      color: Colors.grey,
                    )),
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.locationDot,
                    ),
                    SizedBox(
                      width: context.width*0.05,
                    ),
                    Expanded(
                        child: RichText(
                      text: TextSpan(
                        text: 'Varış Yeri\n',
                        style: TextStyle(color: Colors.grey),
                        children: const <TextSpan>[
                          TextSpan(
                              text:
                                  'Reşitpaşa, Katar Cd No:4 D:1101, 34467 Sarıyer/İstanbul',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  CarouselSlider buildSlider() {
    return CarouselSlider(
      options: CarouselOptions(
          enlargeCenterPage: true, autoPlay: true, viewportFraction: 0.9),
      items: photoList.map<Widget>((index) {
        return Builder(
          builder: (BuildContext context) {
            return Image.asset(
              index.toString(),
            );
          },
        );
      }).toList(),
    );
  }
}

class topBarMenu extends StatefulWidget {
  const topBarMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<topBarMenu> createState() => _topBarMenuState();
}

class _topBarMenuState extends State<topBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Image.asset('assets/images/pp_mini.png'),
      SizedBox(width: context.width*0.01),
      Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'Merhaba\n',
              style: TextStyle(color: Colors.grey),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Ali Adıgüzel',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          )
        ],
      ),
      Spacer(),
      CustomNotificationWidget(number: 1),
    ]);
  }
}

/* import 'package:carryvibeapp/core/constants/image_manager.dart';
import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/features/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: ListTile(
            leading: CircleAvatar(
              maxRadius: 20,
              child: SvgPicture.asset(
                ImageManager.instance.appleIcon,
                fit: BoxFit.cover,
              ),
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Stack(
                  children: const [
                    Icon(
                      Icons.notifications_outlined,
                      color: Colors.black,
                    ),
                    Positioned(
                      top: 3,
                      right: 3,
                      child: Icon(Icons.brightness_1, size: 8.0, color: Colors.red),
                    )
                  ],
                )),
            title: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Günaydın",
                style: context.textTheme.bodySmall,
                textAlign: TextAlign.start,
              ),
            ),
            subtitle: Text(
              "Baran KİNCUCE",
              style: context.textTheme.headline2,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is HomeError) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                builder: (context, state) {
                  if (state is HomeCompleted) {
                    return Container(
                      margin: const EdgeInsets.only(top: 40),
                      height: 200,
                      color: Colors.pinkAccent,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.responseModel.length - 1,
                        itemBuilder: (context, index) {
                          if (state.responseModel[index].imageUrl != null) {
                            return Image.network(
                              state.responseModel[index].imageUrl ?? '',
                              fit: BoxFit.cover,
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    );
                  }
                  if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return const SizedBox();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0, left: 2),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Güncel Durum",
                          style: context.textTheme.headline1,
                        ),
                      ),
                    ),
                    Card(
                      elevation: 0,
                      color: const Color(0xFFF8F8F8),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Istanbul",
                              style: context.textTheme.bodySmall,
                            ),
                            Container(
                              color: Colors.black,
                              height: 2,
                              width: 200,
                            ),
                            Text(
                              "Ankara",
                              style: context.textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
} */
