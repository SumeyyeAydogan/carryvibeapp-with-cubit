import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/core/style.dart';
import 'package:carryvibeapp/product/widgets/button/custom_elevated_button.dart';
import 'package:carryvibeapp/product/widgets/notification.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class RequestCreatePage extends StatefulWidget {
  RequestCreatePage({Key? key}) : super(key: key);

  @override
  State<RequestCreatePage> createState() => _RequestCreatePageState();
}

class _RequestCreatePageState extends State<RequestCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          width: context.width,
          height: context.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/background.png",
                ),
                fit: BoxFit.cover),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, right: 30),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: CustomNotificationWidget(
                  number: 1,
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: SingleChildScrollView(
            child: Container(
                width: context.width,
                height: context.height * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                    color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            maxRadius: 25,
                            child: Image.asset("assets/profile.png",
                                fit: BoxFit.cover),
                          ),
                          SizedBox(
                            width: context.width * 0.03,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Ali A.\n',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                    text: 'Taşıyıcı',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [customText("45", "Taşıma")],
                        ),
                        Column(
                          children: [customText("45", "Gönderme")],
                        ),
                        Column(
                          children: [customText("4.5/5", "puan")],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: context.height * 0.03,
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
                                    height: context.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Icon(FontAwesomeIcons.calendar),
                                      SizedBox(
                                        width: context.width * 0.01,
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
                                    height: context.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.clock,
                                        color: Colors.orange,
                                      ),
                                      SizedBox(
                                        width: context.width * 0.01,
                                      ),
                                      Text("12:00")
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: context.height * 0.05,
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
                                      width: context.width * 0.05,
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
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 11.5),
                                  height: context.height * 0.03,
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
                                      width: context.width * 0.05,
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
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ],
                                      ),
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    CustomElevationButton(
                      title: Text(
                        "Talep Oluştur",
                        style: bold25,
                      ),
                      onPressed: () => createRequest(),
                      primaryColor: Color(0xFFFCB064),
                    )
                  ],
                )),
          ),
        )
      ]),
    );
  }

  Future<void> createRequest() async {
    print("Request Created");
  }

  RichText customText(String text1, String text2) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: '${text1}\n',
        style: TextStyle(
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(text: text2, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
