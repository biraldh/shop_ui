import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  final List sizes = [1, 2, 3, 4, 5, 6, 7];
  final List<int> colors = [0xFFF03B3B, 0xFF222222, 0xFFE9B424];
  String selectedSize = '';
  int selectedColor = 0;
  int quantity = 0;
  final TextEditingController quantityController = TextEditingController()
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
                  padding: EdgeInsets.only(top: 8),
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
                                  padding: const EdgeInsets.only(left: 16.0),
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                                            color: Color(color),
                                          ),
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
                        padding: const EdgeInsets.only(left: 28.0),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                quantity--;
                                quantityController.text = quantity.toString();
                              });
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Color(0xFF006FFD),
                            )),
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: quantityController,
                          onChanged: (value) {
                            quantity = int.parse(value);
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFE8E9F1)),
                                borderRadius: BorderRadius.circular(49.11)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFE8E9F1)),
                                borderRadius: BorderRadius.circular(49.11)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: IconButton(
                            onPressed: () {
                              quantity++;
                              quantityController.text = quantity.toString();
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
                  padding: EdgeInsets.only(top: 24.0, bottom: 12),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16.0)),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            // return SizedBox(
                            return FractionallySizedBox(
                              heightFactor: 0.9,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: Color(0xFF006FFD),
                                                  size: 32,
                                                )),
                                            Text(
                                              'Summary',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF006FFD),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3.0,
                                                          bottom: 3.0,
                                                          left: 5.5,
                                                          right: 5.5),
                                                  child: Text(
                                                    quantity.toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.close,
                                              color: Color(0xFF1F2024),
                                              size: 32,
                                            )),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: const Color(0xFFE8E9F1)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 16.0),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            //image
                                            Padding(
                                              padding: const EdgeInsets.only(left: 16.0, right: 16),
                                              child: Container(
                                                height: 43,
                                                width: 43,
                                                decoration: BoxDecoration(
                                                  color: Colors.blue
                                                ),
                                              ),
                                            ),
                                            //texts
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  //name and quantity
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('Nike Kyrie 3 -OG Black',
                                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                                                      ),
                                                      Text('x2', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                                                    ],
                                                  ),
                                                  Text('NRP 24,000',
                                                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
                                                  ),
                                                  Row(
                                                    children: [
                                                      IconButton(onPressed: (){},
                                                          icon: Icon(Icons.remove, color: Color(0xFF006FFD),)
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: Color(0xFFE8E9F1))
                                                        ),
                                                        width: 45,
                                                        height: 32,
                                                        child: Center(child: Text(quantity.toString()))
                                                      ),
                                                      IconButton(onPressed: (){},
                                                          icon: Icon(Icons.add, color: Color(0xFF006FFD),)
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
                                  )
                                ],
                              ),
                            );
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
