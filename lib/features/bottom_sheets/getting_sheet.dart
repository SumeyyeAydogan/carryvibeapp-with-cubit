import 'package:carryvibeapp/features/bottom_sheets/contracts_sheet.dart';
import 'package:carryvibeapp/features/bottom_sheets/offer_sheet.dart';
import 'package:carryvibeapp/features/bottom_sheets/payment/pay_sheet.dart';
import 'package:carryvibeapp/features/bottom_sheets/settings/settings_sheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carryvibeapp/features/main/main_page.dart';

/* Widget postSheet() {
  return state.tabController?.index == 0 ? AddTravelPage() : AddProductPage();
} */


//Widget postSheet() => isCarrierPage ? AddTravelPage() : AddProductPage();
// ??AddProductPage(); //Gönderici sayfasında + ikonuna basarsa bu sayfaya gelecek
//Taşıyıcı sayfasında basarsa farklı bir sayfaya yönlendirilecek

Widget contractSheet() => ContractPage();

Widget offerSheet() => OfferPage();

Widget paySheet() => CreditCardPage();

Widget settingsSheet() => SettingsPage();


Widget authenticationSheet() => authenticationSheet();
FirebaseAuth auth = FirebaseAuth.instance;
sendLink() async {
  await auth.currentUser!.sendEmailVerification();
}
