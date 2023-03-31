import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/product/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  PageController pageController = PageController();
  TextEditingController contName = TextEditingController();
  TextEditingController contMail = TextEditingController();
  TextEditingController contPassword = TextEditingController();
  TextEditingController contNumber = TextEditingController();

  Future<void> infoTextForm() async {
    debugPrint(
        "Kullanici adi : ${contName.text}, Mail : ${contMail.text}, Numara : ${contNumber.text}");
  }

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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(FontAwesomeIcons.x),
                          CircleAvatar(
                            maxRadius: 50,
                            child: Image.asset(
                              "assets/profile.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Icon(FontAwesomeIcons.pencil),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height*0.03,
                    ),
                    customTextFormField(
                        contName, "Kullanıcı Adı", TextInputType.name, false),
                    customTextFormField(contMail, "Mail Adresi",
                        TextInputType.emailAddress, false),
                    customTextFormField(
                        contPassword, "Parola", TextInputType.name, true),
                    customTextFormField(
                        contNumber, "Telefon No", TextInputType.number, false),
                    SizedBox(
                      height: context.height*0.02,
                    ),
                    CustomElevationButton(
                      onPressed: infoTextForm,
                      title: Text("Güncelle"),
                      primaryColor: Color(0xFFFCB064),
                    ),
                  ],
                )),
          ),
        )
      ]),
    );
  }

  Padding customTextFormField(TextEditingController contName,
      String placeHolder, TextInputType keyboard, bool isHidden) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10),
        child: TextFormField(
          //initialValue: "Sümeyye Aydoğan",
          obscureText: isHidden,
          keyboardType: keyboard,
          controller: contName,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xFFE8ECF4),
            hintText: placeHolder,
            border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: Color(0xFFE8ECF4))), //<-- SEE HERE
          ),
        ),
      ),
    );
  }
}