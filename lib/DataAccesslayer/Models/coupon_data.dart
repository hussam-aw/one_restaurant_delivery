class CouponData {
  int amount;
  String type;
  int? mealId;
  String amountType;

  CouponData({
    required this.amount,
    required this.type,
    required this.mealId,
    required this.amountType,
  });

  factory CouponData.fromJson(Map<String, dynamic> json) => CouponData(
        amount: json["amount"],
        type: json["type"],
        mealId: json["meal_id"],
        amountType: json["amount_type "],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "type": type,
        "meal_id": mealId,
        "amount_type ": amountType,
      };
}
