import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:shop_ui/pages/widgets/itemWidget.dart';

class BottomSheetWidget extends StatefulWidget {
  final int quantity;

  const BottomSheetWidget({super.key, required this.quantity});

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  List itemIndex = [1,2,3,4];

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons
                              .keyboard_arrow_down_rounded,
                          color: Color(0xFF006FFD),
                          size: 32,
                        )),
                    const Text(
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
                            color: const Color(0xFF006FFD),
                            borderRadius:
                            BorderRadius.circular(
                                20)),
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(
                            horizontal: 5.5,
                            vertical: 3.0
                          ),
                          child: Text(
                            widget.quantity.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Color(0xFF1F2024),
                      size: 32,
                    )),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemIndex.length,
              itemBuilder: (context,index){
                return ItemWidget(itemIndex: itemIndex[index], deleteItem: () {
                  setState(() {
                    itemIndex.removeAt(index);
                  });
                },);
            }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE86339)),
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFFFFEFE7),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Order Summary', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Amount', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0),
                              child: Text('Discount', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top:8.0),
                              child: Text('VAT', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text('Net Amount', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16.0),
                          child: Column(
                            children: [
                              Text('40,000', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text('1,500', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top:8.0),
                                child: Text('3,500', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Text('42,000', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
            child: GestureDetector(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF006FFD),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 11.0),
                          child: Center(child: Text('Next', style: TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.w600),)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
