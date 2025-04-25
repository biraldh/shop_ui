import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../item_provider/item_provider_notifier.dart';
import '../../provider.dart';

class ItemWidget extends ConsumerStatefulWidget {
  final VoidCallback deleteItem;
  final int itemIndex;

  const ItemWidget(
      {super.key, required this.deleteItem, required this.itemIndex});

  @override
  ConsumerState<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends ConsumerState<ItemWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Slidable(
        key: UniqueKey(),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          extentRatio: 0.2,
          children: [
            GestureDetector(
              onTap: widget.deleteItem,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3F4),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
                  border: Border.all(color: const Color(0xFFE8E9F1)),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 44),
                  child: Icon(
                    Icons.delete_outlined,
                    color: Color(0xFFED3241),
                  ),
                ),
              ),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), // Default rounded corners
            border: Border.all(color: const Color(0xFFE8E9F1)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Container(
                    height: 43,
                    width: 43,
                    decoration: const BoxDecoration(color: Colors.blue),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //name and quantity
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nike Kyrie 3 -OG Black ${widget.itemIndex}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Text(
                              'x2',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      const Text(
                        'NRP 24,000',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                ref.read(itemProviderProvider.notifier).subQuantity(widget.itemIndex.toString());
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Color(0xFF006FFD),
                              )),
                          Consumer(
                            builder: (context, ref, child) {
                              final items = ref.watch(itemProviderProvider);
                              final item = items.firstWhere((it) => int.parse(it.id) == widget.itemIndex);
                              return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                          color: const Color(0xFFE8E9F1))),
                                  width: 45,
                                  height: 32,
                                  child: Center(
                                      child: Text(item.quantity.toString()),
                                  ),
                              );
                            },
                          ),
                          IconButton(
                            onPressed: () {
                              ref.read(itemProviderProvider.notifier).addQuantity(widget.itemIndex.toString());
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Color(0xFF006FFD),
                            )
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
