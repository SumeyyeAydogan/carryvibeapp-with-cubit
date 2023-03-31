import 'package:carryvibeapp/features/posts/model/carrier_orders_model.dart';

class Post {
  final String? name;
  final String? startLocation;
  final String? finishLocation;
  final String? date;
  final String? time;
  final String? image;
  final String? product;
  final num? price;
  final int? sizeType;

  Post(
      {this.name,
      this.startLocation,
      this.finishLocation,
      this.date,
      this.time,
      this.image,
      this.product,
      this.price,
      this.sizeType});
}
