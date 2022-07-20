import 'package:clean_arch/data/network/api_client.dart';
import 'package:clean_arch/data/requests/requests.dart';
import 'package:clean_arch/data/responses/responses.dart';

abstract class RemoteDataSource{
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource{
  final ApiClient _apiClient;
  RemoteDataSourceImpl(this._apiClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) {
   return _apiClient.login(loginRequest.username, loginRequest.password);
  }




}