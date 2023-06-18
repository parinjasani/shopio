import 'package:flutter/material.dart';
import 'package:shopio/model/item.dart';

class SlidView extends StatelessWidget {
  Item item;
  SlidView(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        AspectRatio(
            aspectRatio: 14 / 16,
            child: Image.asset(item.images)),
        Text(
          item.title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16,),
        Text(
          item.subtitle,
          style: TextStyle(fontSize: 16,color: Colors.grey),
        )
      ],
    );
  }
}
