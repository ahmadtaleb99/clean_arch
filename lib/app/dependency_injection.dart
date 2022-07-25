import 'package:clean_arch/app/app_prefs.dart';
import 'package:clean_arch/data/data_source/remote_data_source.dart';
import 'package:clean_arch/data/network/api_client.dart';
import 'package:clean_arch/data/network/dio_factory.dart';
import 'package:clean_arch/data/network/network_info.dart';
import 'package:clean_arch/data/repository_impl/repository_impl.dart';
import 'package:clean_arch/domain/repository/repository.dart';
import 'package:clean_arch/domain/usecase/forget_password_usercase.dart';
import 'package:clean_arch/domain/usecase/login_usecase.dart';
import 'package:clean_arch/prsentation/forgot_password/viewmodel/forget_password_viewmodel.dart';
import 'package:clean_arch/prsentation/login/viewmodel/login_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIT = GetIt.instance;

//di for all the app must be lazy and for specific module has to be factory so we use new instance every time 
Future<void> initAppModules() async {

  //shared prefs
  final _prefs = await SharedPreferences.getInstance();
  getIT.registerLazySingleton<SharedPreferences>(() => _prefs);


  //app prefs
  final _appPreferences = AppPreferences(getIT<SharedPreferences>());
  getIT.registerLazySingleton<AppPreferences>(() => _appPreferences);


  //dio Factoty
  getIT.registerLazySingleton(() => DioFactory(getIT<AppPreferences>()));

  final dio = await getIT<DioFactory>().getDio();

  //api client
  getIT.registerLazySingleton<ApiClient>(() => ApiClient(dio));

  //remote data source
  getIT.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(getIT<ApiClient>()));


  //repository
  getIT.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(getIT<RemoteDataSource>(),NetworkInfoImpl()));




}

 void initLoginModule() {
   if (!GetIt.I.isRegistered<LoginUseCase>()) {
     getIT.registerFactory(() =>
         LoginUseCase(getIT<AuthenticationRepository>()));
     getIT.registerFactory(() => LoginViewModel(getIT<LoginUseCase>()));
   }



 }


void initForgetPasswordModule() {
  if (!GetIt.I.isRegistered<ForgetPasswordUsecase>()) {
    getIT.registerFactory(() =>
        ForgetPasswordUsecase(getIT<AuthenticationRepository>()));
    getIT.registerFactory(() =>
        ForgetPasswordViewModel(getIT<ForgetPasswordUsecase>()));
  }
}