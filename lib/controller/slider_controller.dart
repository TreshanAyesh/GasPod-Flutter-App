import 'package:gas_pod/data/repository/slider_repo.dart';
import 'package:get/get.dart';
import 'package:gas_pod/models/slidermodel.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductlist = [];
  List<dynamic> get popularProductlist => _popularProductlist;

  bool _isLoaded = false; //originally false
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList();

    if(response.statusCode == 200){
      print("got values");
      _popularProductlist = [];
      _popularProductlist.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{

      print("slidercontroller could not get values");
    }
  }
}