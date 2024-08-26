import 'package:api_test_program/model_class/model.dart';
import 'package:api_test_program/screen/widget/whislist.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductTiles extends StatelessWidget {
  final ProductDetails products;
  ProductTiles( this.products);


  @override
  Widget build(BuildContext context) {

    return Card(
      margin: EdgeInsets.all(6),
      child: Column(
        children: [
          Stack(
            children:[
              Positioned(child: IconButton(onPressed: (){


              }, icon: Icon(Icons.favorite_border,)),
              right: 7,
              ),
              Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),

              ),
              child: CachedNetworkImage(imageUrl: products.imageLink!,
              fit: BoxFit.contain,),

            ),
      ]
          ),
          SizedBox(
            height: 5,
          ),
          Text(products.name!,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.bold
          ),),

          // Text(products.description!,  style: TextStyle(
          //     color: Colors.black,
          //     fontSize: 12,
          //     fontWeight: FontWeight.bold
          // ),),

          Text( '${products.price!}\$',  style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold
          ),)
        ],
      ),

    );
  }
}
