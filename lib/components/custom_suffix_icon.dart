import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSuffix extends StatelessWidget {
  String svgIcon;

  CustomSuffix({required this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 18, 18, 18),
      child: SvgPicture.asset(
        svgIcon,
        height: 18,
        colorFilter: ColorFilter.mode(Colors.black45, BlendMode.srcIn),
      ),
    );
  }
}
