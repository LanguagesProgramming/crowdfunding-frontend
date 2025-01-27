import 'dart:ffi';

import 'package:flutter/material.dart';

class TransactionComponent extends StatelessWidget {
  String name;
  String imageUrl;
  String campaignName;
  double value;
  int units;

  TransactionComponent({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.campaignName,
    required this.value,
    required this.units,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFC1E965),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
              imageUrl,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text('\$$value'),
              Text('$units units'),
            ],
          ),
        ],
      ),
    );
  }
}

