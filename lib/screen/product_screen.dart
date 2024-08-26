import 'package:api_test_program/controller/controller.dart';
import 'package:api_test_program/screen/widget/productsTiles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProductScreen(),
  ));
}

class ProductScreen extends StatelessWidget {
   ProductScreen({super.key});
  final ProductDetailsController productDetailsController =Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_checkout,color: Colors.white,))
        ],
      ),
      
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Learn With Pradeeb",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
              SizedBox(width: 20,),
              IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
              IconButton(onPressed: (){}, icon: Icon(Icons.home_outlined)),
            ],
          ),

          SizedBox(height: 20,),
          Expanded(
            child: Obx(()
                {
            if(productDetailsController.isLoading.value){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else
              {
                return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemBuilder:(context,index){
                  return ProductTiles(
            productDetailsController.productsList[index]
                  );
                    },
                itemCount: productDetailsController.productsList.length,);
              }
            }),
          ),
        ],
      ),
    );
  }
}
