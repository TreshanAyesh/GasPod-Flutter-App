import 'package:gas_pod/data/repository/slider_repo.dart';
import 'package:get/get.dart';
import 'package:gas_pod/models/gas_lvl_model.dart';

class dataController extends GetxController{
  final dataRepo gaslvlRepo;
  dataController({required this.gaslvlRepo});
  List<dynamic> _gaslvllist = [];
  List<dynamic> get gaslvllist => _gaslvllist;

  bool _isLoaded = false; //originally false
  bool get isLoaded => _isLoaded;

  Future<void> getGaslvlList()async {
    Response response = await gaslvlRepo.getdataList();
    if(response.statusCode == 200){
      print("got values");
      _gaslvllist = [];
      _gaslvllist.addAll(gas_lvl.fromJson(response.body).values);
      _isLoaded = true;
      update();
    }else{

    }
  }
}