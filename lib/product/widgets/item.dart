import 'package:auto_route/auto_route.dart';
import 'package:carryvibeapp/core/extension/context_extension.dart';
import 'package:carryvibeapp/core/style.dart';
import 'package:carryvibeapp/features/delivery/cubit/delivery_cubit.dart';
import 'package:carryvibeapp/features/delivery/view/delivery_view.dart';
import 'package:carryvibeapp/features/posts/model/post_model.dart';
import 'package:carryvibeapp/product/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

class Item extends StatelessWidget {
  final Post selectPost;
  final Widget widget;
  final int pageNumber;
  //final Widget priceOrDateWidget;
  Item(
      {Key? key,
      /* required this.priceOrDateWidget, */ required this.selectPost,
      required this.widget,
      required this.pageNumber})
      : super(key: key) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Card(
        child: ListTile( 
          onTap: () {
            if (pageNumber == 1) {
              context.navigateTo(RequestCreateRoute());
            } else {
              bool showButtons = true; //sonra halledicem key mantığıyla
            }
          },
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        "assets/images/person${selectPost.image}.jpg"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          title: Text(
            selectPost.name ?? selectPost.product ?? "",
            style: bold18,
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        // ignore: deprecated_member_use
                        FontAwesomeIcons.dotCircle,
                        color: Colors.orange,
                        size: 18,
                      ),
                      SizedBox(
                        width: context.height * 0.01,
                      ),
                      Text(
                        selectPost.startLocation.toString(), // ?? "",
                        style: grey2,
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8),
                    height: context.height * 0.025,
                    decoration: BoxDecoration(
                      border: RDottedLineBorder(
                          left: BorderSide(
                        color: Colors.grey,
                      )),
                    ),
                  ),
                  /* SizedBox(
                    height: context.height * 0.01,
                  ), */
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.locationDot,
                        size: 19,
                      ),
                      SizedBox(
                        width: context.height * 0.01,
                      ),
                      Text(
                        selectPost.finishLocation.toString(), // ?? "",
                        style: grey2,
                      ),
                    ],
                  ),
                ],
              ),
              widget,
            ],
          ),
        ),
      ),
    );
  }
}

class PriceWidget extends StatelessWidget {
  final Post selectPost;
  const PriceWidget({required this.selectPost, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 30),
      child: Text(
        '${selectPost.price ?? '-'} ₺',
        style: bold18,
      ),
    );
  }
}

class SizeTypeAndPriceWidget extends StatelessWidget {
  final Post selectPost;
  const SizeTypeAndPriceWidget({required this.selectPost, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Builder(builder: (context) {
          switch (selectPost.sizeType) {
            case 0:
              return Text(
                'Küçük',
                style: context.textTheme.headline2,
              );
            case 1:
              return Text(
                'Orta',
                style: context.textTheme.headline2,
              );
            case 2:
              return Text('Büyük', style: context.textTheme.headline2);
            default:
              return Text('-', style: context.textTheme.headline2);
          }
        }),
        SizedBox(
          height: context.height * 0.01,
        ),
        Builder(builder: (context) {
          switch (selectPost.sizeType) {
            case 0:
              return Text('30 ₺', style: context.textTheme.headline2);
            case 1:
              return Text('60 ₺', style: context.textTheme.headline2);
            case 2:
              return Text('90 ₺', style: context.textTheme.headline2);
            default:
              return Text(
                '-',
                style: bold18,
              );
          }
        }),
      ],
    );
  }
}

class DateWidget extends StatelessWidget {
  final Post selectPost;
  const DateWidget({required this.selectPost, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          selectPost.date ?? "",
          style: grey2,
        ),
        SizedBox(
          height: context.height * 0.01,
        ),
        Text(
          selectPost.time ?? "",
          style: grey2,
        ),
      ],
    );
  }
}

class AddWidget extends StatelessWidget {
  const AddWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30, bottom: 30),
      child: Icon(Icons.add_circle_outline),
    );
  }
}
/*  */