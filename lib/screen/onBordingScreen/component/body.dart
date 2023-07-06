import 'package:flutter/material.dart';
import 'package:shopio/Routes/approutes.dart';
import 'package:shopio/preferences/pref_utils.dart';
import 'package:shopio/screen/onBordingScreen/component/slidview.dart';

import '../../../model/item.dart';
import 'indicator.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var itemList = <Item>[];
  int currenindex=0;
  final pageviewcontroller=PageController();
  @override
  void initState() {
    // TODO: implement initState
    itemList.add(Item(
        title: "Select item",
        images: "assets/images/select-items.png",
        subtitle:
            'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.'));
    itemList.add(Item(
        title: "Purchase",
        images: "assets/images/purchase.png",
        subtitle:
            'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.'));
    itemList.add(Item(
        title: "Delivery",
        images: "assets/images/delivery.png",
        subtitle:
            'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.'));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Scaffold(
        body: PageView.builder(
          controller: pageviewcontroller,
          onPageChanged: (value) {
           setState(() {
             currenindex=value;
           });
          },
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return SlidView(itemList[index]);
          },
        ),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                for (int i = 0; i < itemList.length; i++)
                  if(i==currenindex)
                    getIndicator(true)
                  else
                    getIndicator(false)

              ],
            ),
            ElevatedButton(
              onPressed: () {
               if(currenindex!=itemList.length-1){
                 ++currenindex;
                 pageviewcontroller.animateToPage(currenindex, duration: Duration(milliseconds: 300), curve: Curves.linear);
               }
               else{
                 //navigate to sign in screen
                 PrefUtils.updateonboardingstatus(true).then((value) {
                   if(value)
                     {
                       Navigator.pushReplacementNamed(context, AppRoute.signinscreen);
                     }
                 },);
               }
              },
              child: Text(currenindex!=itemList.length-1?"Next":"Finish"),
            ),
          ],
        ),
      ),
    );
  }
}
