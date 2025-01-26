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
    return Column(
      children: [
        Image(
          image: NetworkImage(
            imageUrl,
          ),
        ),
        Row(
          children: [
            Text(
              campaignName,
              textAlign: TextAlign.left,
            )
          ],
        ),
        Text(
          name,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$$value'),
            Text('$units units'),
          ],
        ),
      ],
    );
  }
}