
import 'package:gas_pod/data/repository/slider_repo.dart';
import 'package:get/get.dart';
import 'package:gas_pod/models/slidermodel.dart';

import '../data/repository/gasdata_repo.dart';

class gasController extends GetxController{
  final gasRepo gasDataRepo;
  gasController({required this.gasDataRepo});
  List<dynamic> _gasDatalist = [];
  List<dynamic> get gasDatalist => _gasDatalist;

  bool _isLoaded = false; //originally false
  bool get isLoaded => _isLoaded;

  Future<void> getGasDataList()async {
    Response response = await gasDataRepo.getGasDataList();
    if(response.statusCode == 200){
      print("got values");
      _gasDatalist = [];
      _gasDatalist.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    }else{
      print("gascontroller could not get values");
    }
  }
}