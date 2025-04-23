import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({super.key});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  final List sizes = [1,2,3,4,5,6,7];
  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(centerTitle: true, leading: GestureDetector(
        child: const Icon(Icons.arrow_back_ios),
      ),
        title: const Text('Product Details',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Padding(
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
              child: Text('SKU ID: 4834', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),),
            ),
            const Padding(padding: EdgeInsets.only(top: 16),
              child: Text('Nike Kyrie 3 -OG Black',
                style: TextStyle(fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 8),
              child: Text('NRP 12,000',
                style: TextStyle(fontWeight: FontWeight.w600,
                    fontSize: 14),),
            ),

            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFFEEEBFF)
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.only(left: 12, right: 12 ),
                    child:  Text('SALE\!! 2\% OFF',
                      style: TextStyle(color: Color(0xFF7B61FF)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xFFE8F8F0)
                    ),
                    child: const Padding(
                      padding:  EdgeInsets.only(left: 12, right: 12 ),
                      child:  Text('IN STOCK: 40 PCS',
                        style: TextStyle(color: Color(0xFF09A456)
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Padding (
              padding:  EdgeInsets.only(top: 32.0, left: 16),
              child: Text('Size', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),),
            ),
            SizedBox(
              child: Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Wrap(
                      children: sizes.map((size) => Padding(
                          padding: const EdgeInsets.only(left: 16.0, right: 24),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFE8E9F1)),
                              borderRadius: BorderRadius.circular(6)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(size.toString()),
                            ),
                          ),
                        )).toList(),
                    ),
                  );
                },
              )
            )
          ],
        ),
      )
    );
  }
}
