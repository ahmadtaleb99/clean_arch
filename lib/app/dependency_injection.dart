import 'package:clean_arch/app/app_prefs.dart';
import 'package:clean_arch/data/data_source/local_data_source.dart';
import 'package:clean_arch/data/data_source/remote_data_source.dart';
import 'package:clean_arch/data/network/api_client.dart';
import 'package:clean_arch/data/network/dio_factory.dart';
import 'package:clean_arch/data/network/network_info.dart';
import 'package:clean_arch/data/repository_impl/repository_impl.dart';
import 'package:clean_arch/domain/repository/repository.dart';
import 'package:clean_arch/domain/usecase/forget_password_usercase.dart';
import 'package:clean_arch/domain/usecase/home_usecase.dart';
import 'package:clean_arch/domain/usecase/login_usecase.dart';
import 'package:clean_arch/domain/usecase/register_usecase.dart';
import 'package:clean_arch/domain/usecase/store_details_usecase.dart';
import 'package:clean_arch/prsentation/forgot_password/viewmodel/forget_password_viewmodel.dart';
import 'package:clean_arch/prsentation/login/viewmodel/login_viewmodel.dart';
import 'package:clean_arch/prsentation/main/pages/home/viewmodel/home_viewmodel.dart';
import 'package:clean_arch/prsentation/register/viewmodel/register_viewmodel.dart';
import 'package:clean_arch/prsentation/store_details/viewmodel/store_details_viewmodel.dart';
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

  getIT.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());


  //repository
  getIT.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl(getIT<RemoteDataSource>(),NetworkInfoImpl(),getIT<LocalDataSource>()));




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


void initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    getIT.registerFactory(() =>
        RegisterUseCase(getIT<AuthenticationRepository>()));
    getIT.registerFactory(() =>
        RegisterViewModel(getIT<RegisterUseCase>()));
  }
}


void initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    getIT.registerFactory(() =>
        HomeUseCase(getIT<AuthenticationRepository>()));
    getIT.registerFactory(() =>
        HomeViewModel(getIT<HomeUseCase>()));
  }
}


void initStoreDetails() {
  if (!GetIt.I.isRegistered<StoreDetailsUseCase>()) {
    getIT.registerFactory(() =>
        StoreDetailsUseCase(getIT<AuthenticationRepository>()));


    getIT.registerFactory(() =>
        StoreDetailsViewModel(getIT<StoreDetailsUseCase>()));
  }
}

