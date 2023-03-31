import 'package:flutter/material.dart';

import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserFeatureWidgets extends StatelessWidget {
  final bool isRate;
  final num? carrierValue;
  final num? senderValue;
  final num? gainValue;
  final num? ratingValue;
  const UserFeatureWidgets({
    Key? key,
    required this.isRate,
    this.carrierValue,
    this.senderValue,
    this.gainValue,
    this.ratingValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Padding(
          padding: context.paddingHighHorizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('${carrierValue ?? 0}'),
                  const Text('Taşıma'),
                ],
              ),
              Column(
                children: [
                  Text('${senderValue ?? 0}'),
                  const Text('Gönderme'),
                ],
              ),
              isRate != true
                  ? Column(
                      children: [
                        Text('${gainValue ?? 0}'),
                        const Text("Kazanç (₺)"),
                      ],
                    )
                  : Column(
                      children: [
                        RatingBar.builder(
                          itemSize: 15,
                          ignoreGestures: true,
                          initialRating: ratingValue != null ? ratingValue!.toDouble() : 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(vertical: 1),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        Text('$ratingValue'),
                      ],
                    ),
            ],
          ),
        ));
  }
}
