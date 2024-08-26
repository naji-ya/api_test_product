


import 'package:api_test_program/service/service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';




class ProductDetailsController extends GetxController{
  //obs - observable
  var isLoading = true.obs;
  var productsList = [].obs;

  @override
  void onInit() {
    getProductsDetails();
    super.onInit();
  }
  void getProductsDetails() async{
    try{
      isLoading(true);
      var Details = await HttpService.fetchTheProductus();
      if(Details != null){
        productsList.value=Details  ;
      }
    }catch(e){
      print(e);
    }finally{
      isLoading(false);
    }
  }
}