import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shopio/firebase/firebase_service.dart';
import 'package:shopio/model/product.dart';

import '../../../Routes/approutes.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
//  final DatabaseReference mRef = FirebaseDatabase.instance.ref();

  FirebaseService service = FirebaseService();

  void delete(String? id) {
    service.deleteproduct(id!).then((value) {
      if(value)
        {

          //success

        }
      else{
        //error
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoute.productadd);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      // body: Center(
      //   child: FutureBuilder(
      //
      //     future : mRef.child("product-node").once(),
      //     builder: (context, snapshot) {
      //       if(snapshot.hasData)
      //         {
      //           print(snapshot.data!.snapshot.value
      //           );
      //           return Text("${snapshot.data!.snapshot.value}");
      //         }
      //       else if(snapshot.hasError)
      //         {
      //           return  Text("Something went wrong");
      //         }
      //       else
      //         {
      //           return CircularProgressIndicator();
      //         }
      //     },
      //
      //   ),
      // ),
      body: StreamBuilder(
        stream: service.getproductlist(),

        // stream : mRef.child("product-node").onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var productlist = snapshot.data;

            // var productlist = <Product>[];
            //
            // Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as Map;
            //
            // map.values.forEach((element) {
            //   productlist.add(Product.fromMap(element));
            // });

            // print(snapshot.data!.snapshot.value);

            return ListView.builder(
              itemCount: productlist?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.productadd,arguments: productlist[index]);
                  },
                  title: Text("${productlist![index].title}"),
                  subtitle: Text("${productlist![index].description}"),
                  leading:  productlist[index].imagepath.isEmpty ? Icon(Icons.ac_unit) : Image.network(productlist![index].imagepath,width: 80,height: 80,fit: BoxFit.cover,),
                  trailing: GestureDetector(onTap: () {
                    delete(productlist[index].id);
                  },child: Icon(Icons.delete)),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Something went wrong"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }


}
