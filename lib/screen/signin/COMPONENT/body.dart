import 'package:flutter/material.dart';
import 'package:shopio/screen/signin/COMPONENT/footer.dart';
import 'package:shopio/screen/signin/COMPONENT/header.dart';
import 'package:shopio/screen/signin/COMPONENT/sign-form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            reverse: true,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      LayoutHeader(),
                      SizedBox(height: 24,),
                      SigninForm(),
                      SizedBox(height: 24,),
                      LayoutFooter(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
