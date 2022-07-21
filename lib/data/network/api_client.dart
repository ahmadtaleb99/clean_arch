
import 'package:clean_arch/data/responses/responses.dart';
import 'package:clean_arch/prsentation/resources/constants_manager.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';


part 'api_client.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiClient {

factory ApiClient(Dio dio, {String  baseUrl}) = _ApiClient;


 @POST('/customer/login')
 Future<AuthenticationResponse> login(@Field('username') String username,@Field('password') String password);


 @POST('/customer/forget-password')
 Future<ForgetPasswordResponse> forgetPassword(@Field('username') String username);



}