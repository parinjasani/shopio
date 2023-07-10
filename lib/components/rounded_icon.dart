import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  IconData icondata;
  VoidCallback onpress;

  RoundedIcon({required this.icondata, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: MaterialButton(
        onPressed: onpress,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        color: Colors.white,
        child: Icon(
          icondata,
          color: Colors.black54,
        ),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
