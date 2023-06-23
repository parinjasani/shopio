import 'package:flutter/material.dart';
Widget getIndicator(bool active)
{
  return Container(
    margin : EdgeInsets.symmetric(horizontal:3),
    height: active ? 12 :10,
    width:active ? 12 :10,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(active ? 12 :10),
      color: active ? Colors.indigo : Colors.grey
    ),
  );
}