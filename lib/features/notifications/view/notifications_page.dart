import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          width: context.width,
          height: context.height*0.3,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/background.png",
                ),
                fit: BoxFit.cover),
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: SingleChildScrollView(
            child: Container(
                width: context.width,
                height: context.height*0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                    color: Colors.white),
                child: Column(
                  children: [
                    notificationText(),
                    ColumnContent(),
                    ColumnContent(),
                    buildCargoState()
                  ],
                )),
          ),
        )
      ]),
    );
  }

  Future<void> buttonClick() async {
    print("asd");
  }
}

class buildCargoState extends StatelessWidget {
  const buildCargoState({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildCircleAvatar(),
          SizedBox(
            width: context.width*0.05,
          ),
          RichText(
            text: TextSpan(
              text: 'Ali Ş. kargona uygun rota talebini',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: const <TextSpan>[
                TextSpan(
                    text: ' onayladı.',
                    style: TextStyle(
                      color: Color(0xFFFCB064),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class buildCircleAvatar extends StatelessWidget {
  const buildCircleAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 5,
      backgroundColor: Colors.red,
    );
  }
}

class ColumnContent extends StatelessWidget {
  const ColumnContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0), child: buildCircleAvatar()),
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset("assets/notification.png")),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Ali Ş. rotana uygun kargo talebi oluşturdu.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                notificationContent()
              ],
            ),
          ],
        ),
        Divider(),
      ],
    );
  }
}

class notificationContent extends StatelessWidget {
  const notificationContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text("Ret Et"),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFFCB064),
            padding: EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
        SizedBox(
          width: context.width*0.05,
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text("Onayla"),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ],
    );
  }
}

class notificationText extends StatelessWidget {
  const notificationText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "Bildirimler",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        )
      ],
    );
  }
}
