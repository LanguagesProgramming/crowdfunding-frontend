import 'package:flutter/material.dart';

class ProductComponent extends StatelessWidget {
  String productUrl;
  String productName;
  double price;
  Function() onTap;

  ProductComponent(
      {required this.productUrl,
      required this.productName,
      required this.price,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFC1E965),
      child: Row(
        children: [
          Image(
            image: NetworkImage(productUrl),
            height: 100,
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productName,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              Text("1 unit"),
              Text("Buy for \$" + price.toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          )
        ],
      ),
    );
  }
}
