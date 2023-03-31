import 'package:carryvibeapp/core/style.dart';
import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.all(18.0),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
  
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Kampanyalar", style: bold25,),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8, top: 8, bottom: 22),
        child: Text("Ödeme yaparken kodu girmen yeterli olacaktır", style: normal16,),
      ),
      ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
  
            padding: const EdgeInsets.only(bottom: 12),
  
            child: Container(
  
              width: 200,
  
              height: 150,
  
              decoration: BoxDecoration(
  
              borderRadius: BorderRadius.circular(30),
  
              color: Colors.amber),
  
            ));
        },
        ),
  
    ],
  
  ),
);;
  }
}