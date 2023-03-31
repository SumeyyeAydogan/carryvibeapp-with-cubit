import 'dart:ffi';
import 'dart:io';

import 'package:carryvibeapp/core/constants/image_manager.dart';
import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/core/style.dart';
import 'package:carryvibeapp/features/posts/widget/carrier_and_sender_button_widget.dart';
import 'package:carryvibeapp/features/profile/view/widget/profile_photo_widget.dart';
import 'package:carryvibeapp/product/widgets/button/custom_elevated_button.dart';
import 'package:carryvibeapp/product/widgets/topbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomPageContainer extends StatelessWidget {
  final int flex;
  final int flex2;
  final String title;
  final double padding;
  final Widget content;
  final String? assetImage;
  final String buttonText;
  bool showCarrierAndSenderButton;
  bool isSelect1;
  bool isSelect2;
  bool showProfilePhoto;
  bool showCustomElevationButton;
  CustomPageContainer(
      {required this.flex,
      this.flex2 = 8,
      this.title = "",
      required this.padding,
      required this.content,
      this.assetImage,
      this.showCarrierAndSenderButton = false,
      this.isSelect1 = false,
      this.isSelect2 = false,
      this.showProfilePhoto = false,
      this.showCustomElevationButton = false,
      this.buttonText = "",
      Key? key})
      : super(key: key);

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        topBar(),
        Expanded(
            flex: flex,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(50))),
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (showProfilePhoto != false) ProfilePhotoWidget(),
                    if (showCarrierAndSenderButton != true &&
                        showProfilePhoto != true)
                      SizedBox(
                        height: context.height * 0.03,
                      ),
                    if (showProfilePhoto != true && title != "")
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: context.height * 0.01,
                            horizontal: context.width * 0.02),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              title,
                              style: bold25,
                              textAlign: TextAlign.start,
                            )),
                      ),
                    Expanded(flex: flex2, child: content),
                    if (showCustomElevationButton != false)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 90, top: 10),
                        child: CustomElevationButton(
                            primaryColor: context.theme.colorScheme.error,
                            //minimumSize: Size(context.width * 0.9, 45),
                            onPressed: () async {
                              kameraGaleriImageUpload();
                            },
                            title: Text(
                              buttonText,
                              style: whiteBold15,
                            )),
                      ),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  kameraGaleriImageUpload() async {
    final ImagePicker _picker = ImagePicker();
    XFile? _file = await _picker.pickImage(source: ImageSource.camera);
    var _productRef = FirebaseStorage.instance.ref("SenderOrders/product_photos");
    var _task = _productRef.putFile(File(_file!.path));

    _task.whenComplete(() async {
      var _url = await _productRef.getDownloadURL();
      _firestore
          .doc("SenderOrders/BuFw6Uhh5JS8syn0DxfK")
          .set({"product_pic": _url.toString()}, SetOptions(merge: true)); 
      debugPrint("url $_url");
    });
  }
}
