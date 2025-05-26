
import 'package:/config/logs/app_log.dart';
import 'package:/core/constants/api_url/api_url.dart';
import 'package:/core/params/params.dart';
import 'package:/services/api/api_client/api_client.dart'; 

class RealEstateRemoteDataSource with Loggable {
  RealEstateRemoteDataSource(this.apiClient); 
  final ApiClient apiClient; 


  Future<dynamic> addRealEstate(TemplateParams templateParams) async {
    final response = await apiClient.init( 
      path: '', 
      requestType: RequestType.post,
      body: templateParams.params,
    );
    return response;
  }

  Future<dynamic> updateRealEstate(TemplateParams templateParams) async {
    final response = await apiClient.init( 
      path: '', 
      requestType: RequestType.post,
      body: templateParams.params,
    );
    return response;
  }

  Future<dynamic> getAllRealEstates(NoParams noParams) async {
    final response = await apiClient.init( 
      path:'',
      requestType: RequestType.get,
    );
    return response;
  }
  
  dynamic> getRealEstateById(ParamOne paramOne) async {
    final response = await apiClient.init( 
      path: '', 
      requestType: RequestType.get,
    );
    return response;
  }

  
  
  
  Future<dynamic> deleteRealEstate(ParamOne paramOne) async {
    final response = await apiClient.init( 
      path: '', 
      requestType: RequestType.delete,
    );
    return response;
  }
}