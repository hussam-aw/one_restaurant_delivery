class CartItem {
  int mealId;
  int qty;
  num total;
  String? specialOrder;

  CartItem({
    required this.mealId,
    required this.qty,
    required this.total,
    required this.specialOrder,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        mealId: json["id"],
        qty: json["quantity"],
        total: json['total_price'],
        specialOrder: json["special_order"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": mealId,
        "quantity": qty,
        "total_price": total,
        "special_order": specialOrder,
      };
}
