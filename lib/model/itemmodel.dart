class ItemModel {
  final String id;
  final int quantity;

  ItemModel({required this.id, required this.quantity});

  ItemModel copyWith({
    String? id,
    int? quantity
  }) {
    return ItemModel(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
    );
  }
}
