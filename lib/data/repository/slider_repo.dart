import 'package:gas_pod/data/api/api_client.dart';
import 'package:gas_pod/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async{
    return await apiClient.getData( AppConstants.GAS_DATA_URI);
  }
}