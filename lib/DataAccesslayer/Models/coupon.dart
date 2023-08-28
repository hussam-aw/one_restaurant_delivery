import 'package:one_restaurant_delivery/DataAccesslayer/Models/coupon_data.dart';

class Coupon {
  int matched;
  CouponData? data;

  Coupon({
    required this.matched,
    required this.data,
  });

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        matched: json["matched"],
        data: json["data"] == null ? null : CouponData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "matched": matched,
        "data": data?.toJson(),
      };
}
