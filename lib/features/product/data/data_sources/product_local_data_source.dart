
import 'package:/config/logs/app_log.dart';
import 'package:/core/constants/api_url/api_url.dart';
import 'package:/core/params/params.dart';
import 'package:/services/api/api_client/api_client.dart'; 

class ProductRemoteDataSource with Loggable {
  ProductRemoteDataSource(this.apiClient); 
  final ApiClient apiClient; 


  Future<dynamic> addProduct(TemplateParams templateParams) async {
    final response = await apiClient.init( 
      path: '', 
      requestType: RequestType.post,
      body: templateParams.params,
    );
    return response;
  }

  Future<dynamic> updateProduct(TemplateParams templateParams) async {
    final response = await apiClient.init( 
      path: '', 
      requestType: RequestType.post,
      body: templateParams.params,
    );
    return response;
  }

  Future<dynamic> getAllProducts(NoParams noParams) async {
    final response = await apiClient.init( 
      path:'',
      requestType: RequestType.get,
    );
    return response;
  }
  
  dynamic> getProductById(ParamOne paramOne) async {
    final response = await apiClient.init( 
      path: '', 
      requestType: RequestType.get,
    );
    return response;
  }

  
  
  
  Future<dynamic> deleteProduct(ParamOne paramOne) async {
    final response = await apiClient.init( 
      path: '', 
      requestType: RequestType.delete,
    );
    return response;
  }
}