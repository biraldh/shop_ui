import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_ui/pages/widgets/bottomSheetWidget.dart';

import '../provider.dart';

class BuyPage extends ConsumerStatefulWidget {
  const BuyPage({super.key});

  @override
  ConsumerState<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends ConsumerState<BuyPage> {
  final List sizes = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  final List<int> colors = [
    0xFFF03B3B,
    0xFF222222,
    0xFFE9B424,
    0xFFF13B3B,
    0xFF322222,
    0xFFE9B524
  ];
  String selectedSize = '';
  int selectedColor = 0;

  //int quantity = 0;
  late TextEditingController quantityController = TextEditingController()
    ..text = '0';

  @override
  void dispose() {
    quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            'Product Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 312,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    'SKU ID: 4834',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    'Nike Kyrie 3 -OG Black',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 16),
                  child: Text(
                    'NRP 12,000',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFEEEBFF)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 12, right: 12),
                        child: Text(
                          'SALE\!! 2\% OFF',
                          style: TextStyle(color: Color(0xFF7B61FF)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFFE8F8F0)),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 12, right: 12),
                          child: Text(
                            'IN STOCK: 40 PCS',
                            style: TextStyle(color: Color(0xFF09A456)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 32.0, left: 16),
                  child: Text(
                    'Size',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(child: Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Wrap(
                        children: sizes
                            .map((size) => Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16.0, top: 9),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        selectedSize = size.toString();
                                      })
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            color:
                                                selectedSize == size.toString()
                                                    ? const Color(0xFF006FFD)
                                                    : const Color(0xFFE8E9F1)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0,
                                            bottom: 8.0,
                                            left: 12,
                                            right: 12),
                                        child: Text(
                                          size.toString(),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    );
                  },
                )),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0, top: 32),
                  child: Text(
                    'Color',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(child: Builder(
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Wrap(
                        children: colors
                            .map((color) => Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: GestureDetector(
                                    onTap: () => {
                                      setState(() {
                                        selectedColor = color;
                                      })
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: selectedColor == color
                                                  ? const Color(0xFF006FFD)
                                                  : const Color(0xFFE8E9F1)),
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 17,
                                          width: 17,
                                          decoration: BoxDecoration(
                                              color: Color(color),
                                              borderRadius:
                                                  BorderRadius.circular(6)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    );
                  },
                )),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 32),
                  child: Text(
                    'Quantity',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: IconButton(
                            onPressed: () {
                              ref.watch(quantityProvider.notifier).state--;
                              quantityController.text = ref.read(quantityProvider.notifier).state.toString();
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Color(0xFF006FFD),
                            )),
                      ),
                      Consumer(
                        builder: (context, ref, child) {
                          return Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: quantityController,
                                onChanged: (value) {
                                  ref.watch(quantityProvider.notifier).state = int.parse(value);
                                },
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFE8E9F1)),
                                      borderRadius:
                                          BorderRadius.circular(49.11)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFE8E9F1)),
                                      borderRadius:
                                          BorderRadius.circular(49.11)),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: IconButton(
                          onPressed: (){
                            ref.watch(quantityProvider.notifier).state++;
                            quantityController.text = ref.read(quantityProvider.notifier).state.toString();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Color(0xFF006FFD),
                          )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16.0)),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            // return SizedBox(
                            return const BottomSheetWidget();
                          });
                    },
                    child: SizedBox(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xFF006FFD)),
                              child: const Padding(
                                padding:
                                    EdgeInsets.only(top: 11.5, bottom: 11.5),
                                child: Center(
                                    child: Text(
                                  'Add to Invoice',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.white),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
