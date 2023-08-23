class CartItem {
  int mealId;
  int qty;
  String specialOrder;

  CartItem({
    required this.mealId,
    required this.qty,
    required this.specialOrder,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        mealId: json["mealId"],
        qty: json["qty"],
        specialOrder: json["specialOrder"],
      );

  Map<String, dynamic> toJson() => {
        "mealId": mealId,
        "qty": qty,
        "specialOrder": specialOrder,
      };
}
