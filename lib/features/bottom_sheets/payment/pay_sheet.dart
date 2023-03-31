import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/product/widgets/button/custom_elevated_button.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:google_fonts/google_fonts.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({Key? key}) : super(key: key);

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  TextStyle boldText = GoogleFonts.urbanist(fontWeight: FontWeight.w700);
  var cardNumber = "";
  var cardOwner = "******";
  var cardCvv = "";
  var cardHistroy = "";
  var code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        Container(
          width: context.width,
          height: context.height*0.5,
          child: Column(
            children: [
              SizedBox(
                height: context.height*0.07,
              ),
              Text("Ödeme", style: GoogleFonts.urbanist(fontSize: 25)),
            ],
          ),
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
          child: Container(
              width: context.width,
              height: context.height*0.82,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),
                  ),
                  color: Colors.white),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: context.width*0.02,
                              ),
                              Text("Kart Numarası", style: boldText)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    cardNumber = value;
                                  });
                                },
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  CardNumberFormatter(),
                                ],
                                maxLength: 19,
                                keyboardType: TextInputType.number,
                                decoration: customInput("Kart Numarası")),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: context.width*0.02,
                              ),
                              Text("Kart Sahibi", style: boldText)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  cardOwner = value;
                                });
                              },
                              decoration: customInput("Kart Sahibi"),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: context.width*0.02,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Cvv", style: boldText),
                              Container(
                                width: context.width*0.4,
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      cardCvv = value;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                  decoration: customInput("CVV"),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Son Kullanma Tarihi", style: boldText),
                              Container(
                                width: context.width*0.4,
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      cardHistroy = value;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(4),
                                    CardMonthInputFormatter(),
                                  ],
                                  decoration: customInput("Ay/Yıl"),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: context.width*0.02,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: context.height*0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: context.width*0.02,
                          ),
                          Text("Kupon Kodu", style: boldText)
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: context.width*0.6,
                              child: Container(
                                child: TextFormField(
                                    onChanged: (value) {
                                      setState(() {
                                        code = value;
                                      });
                                    },
                                    maxLength: 19,
                                    decoration: customInput("Kupon Kodu")),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: fakeMethod,
                              child: Text(
                                "Uygula",
                                style: TextStyle(color: Color(0xFFFCB064)),
                              )),
                        ],
                      ),
                      CreditCardWidget(
                        cardNumber: cardNumber,
                        expiryDate: cardHistroy,
                        cardHolderName: cardOwner,
                        cvvCode: cardCvv,
                        showBackView: false,
                        textStyle: boldText,
                        labelCardHolder: "",
                        cardBgColor: Color(0xFFFCB064),
                        isHolderNameVisible: true,
                        isSwipeGestureEnabled: false,
                        glassmorphismConfig: Glassmorphism(
                          blurX: 0,
                          blurY: 0,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Colors.white,
                            ],
                            stops: const <double>[
                              1,
                            ],
                          ),
                        ),
                        onCreditCardWidgetChange:
                            (CreditCardBrand) {}, //true when you want to show cvv(back) view
                      ),
                      CustomElevationButton(
                        onPressed: fakeMethod,
                        title: Text("Ödeme"),
                        primaryColor: Color(0xFFFCB064),
                      )
                    ],
                  ),
                ),
              )),
        )
      ]),
    );
  }

  Future<void> fakeMethod() async {
    print("Apply");
  }

  InputDecoration customInput(String text) {
    return InputDecoration(
        counterText: "",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        labelStyle: TextStyle(color: Colors.grey),
        hintText: text,
        border: new OutlineInputBorder(
          borderSide: new BorderSide(),
        ));
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = new StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: new TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}