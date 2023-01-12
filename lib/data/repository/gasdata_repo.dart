import 'package:gas_pod/data/api/api_client.dart';
import 'package:gas_pod/utils/app_constants.dart';
import 'package:get/get.dart';

class gasRepo extends GetxService{
  final ApiClient apiClient;
  gasRepo({required this.apiClient});

  Future<Response> getGasDataList() async{
    return await apiClient.getData(AppConstants.GAS_DATA_URI);
  }
}