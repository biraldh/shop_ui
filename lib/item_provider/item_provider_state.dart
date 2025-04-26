import '../model/itemmodel.dart';

class ItemProviderState {
  final List<ItemModel> items;

  ItemProviderState({required this.items});

  ItemProviderState copyWith({
    List<ItemModel>? items,
  }) {
    return ItemProviderState(
      items: items ?? this.items,
    );
  }
}
