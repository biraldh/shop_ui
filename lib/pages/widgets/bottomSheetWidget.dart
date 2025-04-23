import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  int quantity;
  BottomSheetWidget({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Text('x$quantity', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
                              )
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
                                    borderRadius: BorderRadius.circular(14),
                                      border: Border.all(color: Color(0xFFE8E9F1))
                                  ),
                                  width: 45,
                                  height: 32,
                                  child: Center(child: Text('2'))
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
    );;
  }
}
