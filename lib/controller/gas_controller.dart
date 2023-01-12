
import 'package:gas_pod/data/repository/slider_repo.dart';
import 'package:get/get.dart';
import 'package:gas_pod/models/gas_lvl_model.dart';

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
      _gasDatalist.addAll(gas_lvl.fromJson(response.body).values);
      _isLoaded = true;
      update();
    }else{
      print("could not get values");
    }
  }
}