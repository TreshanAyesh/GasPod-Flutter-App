import 'package:gas_pod/data/api/api_client.dart';
import 'package:gas_pod/utils/app_constants.dart';
import 'package:get/get.dart';

class dataRepo extends GetxService{
  final ApiClient apiClient;
  dataRepo({required this.apiClient});

  Future<Response> getdataList() async{
    return await apiClient.getData(AppConstants.PAGE_VIEW_URI);
  }
}