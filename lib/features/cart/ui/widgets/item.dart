import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';

class Item extends StatelessWidget {
  const Item(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.image,
      this.quantity});

  final String productName;
  final String productPrice;
  final String image;
  final int? quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150.h,
      //height: 180.h,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.network(image),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  productName,
                  maxLines: 2,
                  style: AppTextStyleHelper.font26BlackMedium,
                ),
                Counter(
                  productPrice: productPrice,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key, required this.productPrice});
  final String productPrice;
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int counter = 1;
  late double totalPrice;

  @override
  void initState() {
    totalPrice = (counter * double.parse(widget.productPrice));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '\$$totalPrice',
          style: AppTextStyleHelper.font22PurpleBold,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     IconButton(
        //       onPressed: () {
        //         setState(() {
        //           if(counter > 1){
        //             counter--;
        //           }
        //           totalPrice = counter * double.parse(widget.productPrice);
        //         });
        //       },
        //       icon: const Icon(Icons.remove),
        //     ),
        //     Text(
        //       '$counter',
        //       style: AppTextStyleHelper.font22BlackMedium,
        //     ),
        //     IconButton(
        //       onPressed: () {
        //         setState(() {
        //           counter++;
        //           totalPrice = counter * double.parse(widget.productPrice);
        //         });
        //       },
        //       icon: const Icon(Icons.add),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
